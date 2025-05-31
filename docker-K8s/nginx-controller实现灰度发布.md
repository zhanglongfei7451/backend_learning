```yaml
## 1.检查 Ingress 是否配置了正确的 IngressClass
kubectl get ingress ingress-bcdomains-service-blue -n bcdomains -o yaml
看一下是否有类似字段：
spec:
  ingressClassName: nginx
如果这个 IngressClass 名字不对，controller 不会处理这个资源。
## 2.检查controller的pod内部有无接收到日志，可能没更新ingress的配置

## 3.再看ingress的loadbalance的配置有没有更新ip，更新的话就生效的
status:
  loadBalancer: {}
这说明当前的 Ingress Controller 并没有处理这个 Ingress 资源。


## 4. 接下来怎么排查？
✅ 1. 查看 Service 是否存在：
kubectl get svc -n bcdomains domains-service-blue
✅ 2. 查看它的 Endpoints（这最关键）：
kubectl get endpoints -n bcdomains domains-service-blue -o yaml
你会看到类似：
subsets: null
或者
subsets: []
这种情况说明 Service 后面没有任何 pod 对应到 selector。

## 5.查看controller的实际配置
kubectl exec -it ingress-nginx-controller-6bcff75b57-28rhj -n ingress-nginx -- cat /etc/nginx/nginx.conf
kubectl exec -n ingress-nginx <controller-pod> -- nginx -T


## 6.下划线的头问题
[deployer@CSZZ-PSC-P9F1-MDMZ-VM-OS01-CLOUDDNS-EULER-K8S-01 ~]$ sudo kubectl get cm ingress-nginx-controller -nyw-dns -oyaml
apiVersion: v1
data:
  enable-underscores-in-headers: "true"
  proxy-read-timeout: "120"
  proxy-send-timeout: "120"
  server-tokens: "false" 这有用吗

ChatGPT 说：
你展示的 ConfigMap 配置项属于 Nginx Ingress 控制器的配置。我们可以逐一分析这些配置项，并看看它们是否有助于解决你遇到的问题。
配置项分析
enable-underscores-in-headers: "true"：
这个配置启用了 Nginx 对 HTTP 请求头中包含下划线（_）的支持。在默认情况下，Nginx 对请求头中包含下划线的部分进行过滤，并拒绝这些请求头。这对于一些特殊情况可能很有用，特别是当请求头中有下划线时（如 X-Forwarded-Proto）。
是否有用？ 如果你的请求头中包含了下划线，这个配置可能会有用，但它不会影响常规请求头的转发（如 Host 或 X-Forwarded-For）。


## 7.金丝雀发布
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: dns
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-by-header: user_id
    nginx.ingress.kubernetes.io/canary-by-header-pattern: CIDC-U-xxxx
    nginx.ingress.kubernetes.io/use-regex: "true"
    这些注解控制 Ingress 的行为：

ingress.class: dns
指定使用的 ingress 控制器（例如某个特定的 NGINX 控制器）。
canary: true
表示启用金丝雀部署。
canary-by-header: user_id
表示通过请求头中的 user_id 来决定是否进入金丝雀流量。
canary-by-header-pattern: CIDC-U-xxxx
只有当 user_id 符合这个模式时（可使用正则匹配）才会命中金丝雀服务。
use-regex: true
表示 path 的匹配方式使用正则表达式。
    
    
## 8.金丝雀发布是两个ingress吗，另一个没有任何配置是默认的


ChatGPT 说：
你问得非常关键！是的，在 Kubernetes 中使用 NGINX 实现金丝雀发布（Canary Release）时，“两个 Ingress” 是一种常见也推荐的做法，其中一个是 默认流量入口（主服务），另一个是 金丝雀入口（部分流量）。

🧠 为什么用两个 Ingress 实现金丝雀发布？
✅ 原因一：NGINX Ingress Controller 的设计
NGINX Ingress 的金丝雀发布不是通过某个 Ingress 里的多个 backend 实现的，而是通过 两个独立 Ingress：

一个主 Ingress 处理大部分流量
一个“金丝雀” Ingress 通过注解来指定如何匹配并分发一小部分流量（比如按 header、cookie、权重）

📦 标准结构：
1️⃣ 主 Ingress（默认流量）
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-app
  annotations:
    nginx.ingress.kubernetes.io/use-regex: "true"
spec:
  rules:
    - host: myapp.com
      http:
        paths:
          - path: /api/.*
            pathType: ImplementationSpecific
            backend:
              service:
                name: my-app-stable
                port:
                  number: 80
2️⃣ 金丝雀 Ingress（灰度/测试流量）
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-app-canary
  annotations:
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-by-header: user_id
    nginx.ingress.kubernetes.io/canary-by-header-pattern: CIDC-U-xxxx
    nginx.ingress.kubernetes.io/use-regex: "true"
spec:
  rules:
    - host: myapp.com
      http:
        paths:
          - path: /api/.*
            pathType: ImplementationSpecific
            backend:
              service:
                name: my-app-canary
                port:
                  number: 80
📌 注意：路径和主 Ingress 要保持一致，否则不会被当作同一组路由匹配处理。

❗ 没配置的那个 Ingress 就是主流量
在你的场景中：

ingress-bcdomains-service-green 是默认流量入口（不带 canary 注解）

ingress-bcdomains-service-blue 是金丝雀入口（带 canary 注解）

这种方式的好处是：

配置清晰可控

可以随时删除金丝雀 Ingress 停止灰度发布

也可以设置流量百分比、基于 header/cookie 做路由

✅ 总结
项目	主 Ingress	金丝雀 Ingress
路径配置	有	相同
注解 canary	无	true
流量处理	默认所有	部分条件命中
必要性	是	可选（金丝雀测试时才配置）
如果你想要我帮你验证两个 Ingress 的配置是否满足金丝雀发布的要求，或者帮你设定流量权重、header 筛选，我可以直接帮你改好配置 👍 想继续吗？
```

