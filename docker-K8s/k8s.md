192.168.1.31  k8s-master 
192.168.1.32  k8s-node1
192.168.1.33  k8s-node2 

1. 关防火墙、关selinux、关swap、时间同步、host绑定

2. 三个机子全部安装docker

3. 三个机子全部安装kubeadm、kubectl、kubelat

4. master机子

 ```shell
kubeadm init --kubernetes-version=v1.15.2 --image-repository registry.aliyuncs.com/google_containers --pod-network-cidr=10.244.0.0/16 --service-cidr=10.96.0.0/12 --ignore-preflight-errors=Swap
   
#--kubernetes-version    #指定Kubernetes版本
#--image-repository   #由于kubeadm默认是从官网k8s.grc.io下载所需镜像，国内无法访问，所以这里通过--image-repository指定为阿里云镜像仓库地址
#--pod-network-cidr    #指定pod网络段
#--service-cidr    #指定service网络段
#--ignore-preflight-errors=Swap    #忽略swap报错信息

[root@k8s-master ~]# mkdir -p $HOME/.kube
[root@k8s-master ~]# cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
[root@k8s-master ~]# chown $(id -u):$(id -g) $HOME/.kube/config

[root@k8s-master ~]# docker image ls   #初始化完成后可以看到所需镜像也拉取下来了
REPOSITORY                                                        TAG                 IMAGE ID            CREATED             SIZE
registry.aliyuncs.com/google_containers/kube-scheduler            v1.15.2             88fa9cb27bd2        2 weeks ago         81.1MB
registry.aliyuncs.com/google_containers/kube-proxy                v1.15.2             167bbf6c9338        2 weeks ago         82.4MB
registry.aliyuncs.com/google_containers/kube-apiserver            v1.15.2             34a53be6c9a7        2 weeks ago         207MB
registry.aliyuncs.com/google_containers/kube-controller-manager   v1.15.2             9f5df470155d        2 weeks ago         159MB
registry.aliyuncs.com/google_containers/coredns                   1.3.1               eb516548c180        7 months ago        40.3MB
registry.aliyuncs.com/google_containers/etcd                      3.3.10              2c4adeb21b4f        8 months ago        258MB
registry.aliyuncs.com/google_containers/pause                     3.1                 da86e6ba6ca1        20 months ago       742kB

# 添加flannel网络组件
[root@k8s-master ~]# kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
[root@k8s-master ~]# kubectl get pods -n kube-system |grep flannel    #验证flannel网络插件是否部署成功（Running即为成功）

# 加入两个节点
[root@k8s-node1 ~]kubeadm join 192.168.1.31:6443 --token a4pjca.ubxvfcsry1je626j --discovery-token-ca-cert-hash sha256:784922b9100d1ecbba01800e7493f4cba7ae5c414df68234c5da7bca4ef0c581 --ignore-preflight-errors=Swap
[root@k8s-node2 ~]kubeadm join 192.168.1.31:6443 --token a4pjca.ubxvfcsry1je626j --discovery-token-ca-cert-hash sha256:784922b9100d1ecbba01800e7493f4cba7ae5c414df68234c5da7bca4ef0c581 --ignore-preflight-errors=Swap

[root@k8s-master ~]# kubectl get nodes
NAME         STATUS     ROLES    AGE     VERSION
k8s-master   Ready      master   9m40s   v1.15.2
k8s-node1    NotReady   <none>   28s     v1.15.2
k8s-node2    NotReady   <none>   13s     v1.15.2

[root@k8s-master ~]# kubectl cluster-info
Kubernetes master is running at https://192.168.1.31:6443
KubeDNS is running at https://192.168.1.31:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy


# 查看每个节点下载的镜像
master节点：
[root@k8s-master ~]# docker images
REPOSITORY                                                        TAG                 IMAGE ID            CREATED             SIZE
registry.aliyuncs.com/google_containers/kube-apiserver            v1.15.2             34a53be6c9a7        2 weeks ago         207MB
registry.aliyuncs.com/google_containers/kube-controller-manager   v1.15.2             9f5df470155d        2 weeks ago         159MB
registry.aliyuncs.com/google_containers/kube-scheduler            v1.15.2             88fa9cb27bd2        2 weeks ago         81.1MB
registry.aliyuncs.com/google_containers/kube-proxy                v1.15.2             167bbf6c9338        2 weeks ago         82.4MB
quay-mirror.qiniu.com/coreos/flannel                              v0.11.0-amd64       ff281650a721        6 months ago        52.6MB
registry.aliyuncs.com/google_containers/coredns                   1.3.1               eb516548c180        7 months ago        40.3MB
registry.aliyuncs.com/google_containers/etcd                      3.3.10              2c4adeb21b4f        8 months ago        258MB
registry.aliyuncs.com/google_containers/pause                     3.1                 da86e6ba6ca1        20 months ago       742kB


node1节点
[root@k8s-node1 ~]# docker images
REPOSITORY                                           TAG                 IMAGE ID            CREATED             SIZE
registry.aliyuncs.com/google_containers/kube-proxy   v1.15.2             167bbf6c9338        2 weeks ago         82.4MB
quay-mirror.qiniu.com/coreos/flannel                 v0.11.0-amd64       ff281650a721        6 months ago        52.6MB
registry.aliyuncs.com/google_containers/coredns      1.3.1               eb516548c180        7 months ago        40.3MB
registry.aliyuncs.com/google_containers/pause        3.1                 da86e6ba6ca1        20 months ago       742kB

node2
[root@k8s-node2 ~]# docker images
REPOSITORY                                           TAG                 IMAGE ID            CREATED             SIZE
registry.aliyuncs.com/google_containers/kube-proxy   v1.15.2             167bbf6c9338        2 weeks ago         82.4MB
quay-mirror.qiniu.com/coreos/flannel                 v0.11.0-amd64       ff281650a721        6 months ago        52.6MB
registry.aliyuncs.com/google_containers/pause        3.1                 da86e6ba6ca1        20 months ago       742kB



 ```
