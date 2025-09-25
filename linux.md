# tcpdump



## 常用 HTTP 测试站点

```yaml
# 常用 HTTP 测试站点（可直接在浏览器或 curl 用）

http://neverssl.com
 — 专门保持不启用 SSL，用于触发老旧 captive-portal 或测试“纯 HTTP”。 

http://httpforever.com
 — 类似目的，保证长期提供 HTTP（常被用于 Wi-Fi 登录触发）。 

http://httpbin.org
 — 功能很全的 HTTP 请求/响应测试服务（支持 GET/POST、返回任意状态码、检查 headers、回显 body 等）。（它同时有 HTTPS，但也可通过 http 访问特定端点用于测试）。 

http://example.com
 — IANA 保留的示例域，适合做简单连通性测试或文档示例。 

http://www.testingmcafeesites.com
 — 提供一组测试页面（含示例页面），可以用于安全/访问检测。
```

## 命令

```yaml
tcpdump -i eth0 -nn -s0 -v port 80 udp

-i : 选择要捕获的接口
-s0 : 表示截取报文全部内容
port 80 : 这是一个常见的端口过滤器，表示仅抓取 80 端口上的流量
-A : 表示使用 ASCII 字符串打印报文的全部数据，这样可以使读取更加简单，方便使用 grep 等工具解析输出内容
-w : test.pcap

# 使用过滤器 host 可以抓取特定目的地和源 IP 地址的流量。
tcpdump -i eth0 host 10.10.1.1
# 也可以使用 src 或 dst 只抓取源或目的地：
tcpdump -i eth0 dst 10.10.1.20

# 如果想实时将抓取到的数据通过管道传递给其他工具来处理，需要使用 -l 选项来开启行缓冲模式
```

## 样例

```yaml
# tcpdump -i any -s0 -A -l host 34.223.124.45
6:20:25.249972 IP localhost.localdomain.46594 > ec2-34-223-124-45.us-west-2.compute.amazonaws.com.http: Flags [P.], seq 1:489, ack 1, win 29200, length 488: HTTP: GET /online/ HTTP/1.1
E.....@.@.......".|-...P.
..V.`xP.r..;..GET /online/ HTTP/1.1
Host: sublimesilveroldplay.neverssl.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Referer: http://neverssl.com/
Connection: keep-alive
Upgrade-Insecure-Requests: 1
If-Modified-Since: Wed, 29 Jun 2022 00:23:22 GMT
If-None-Match: "8be-5e28b29291e10-gzip"
Cache-Control: max-age=0

................
06:20:25.250077 IP ec2-34-223-124-45.us-west-2.compute.amazonaws.com.http > localhost.localdomain.46594: Flags [.], ack 489, win 64240, length 0
E..(......F.".|-.....P..V.`x.
..P....U........................
06:20:25.475861 IP ec2-34-223-124-45.us-west-2.compute.amazonaws.com.http > localhost.localdomain.46594: Flags [P.], seq 1:1547, ack 489, win 64240, length 1546: HTTP: HTTP/1.1 200 OK
E..2......@.".|-.....P..V.`x.
..P....]..HTTP/1.1 200 OK
Date: Mon, 15 Sep 2025 13:20:25 GMT
Server: Apache/2.4.62 ()
Upgrade: h2,h2c
Connection: Upgrade, Keep-Alive
Last-Modified: Wed, 29 Jun 2022 00:23:22 GMT
ETag: "8be-5e28b29291e10-gzip"
Accept-Ranges: bytes
Vary: Accept-Encoding
Content-Encoding: gzip
Content-Length: 1173
Keep-Alive: timeout=5, max=100
Content-Type: text/html; charset=UTF-8


# tcpdump -i any -s0 -A -l | egrep -i 'User-Agent:|Host:'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
Host: sublimesilveroldplay.neverssl.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0


# tcpdump -i any -nn -s0 -A -l | egrep -i 'User-Agent:|Host:'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
Host: sublimesilveroldplay.neverssl.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0

# tcpdump -i any -nn -s0 -A -l | egrep -i "POST /|GET /|Host:"
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
06:25:57.385121 IP 192.168.147.132.46608 > 34.223.124.45.80: Flags [P.], seq 1:489, ack 1, win 29200, length 488: HTTP: GET /online/ HTTP/1.1
c%.P.r..;..GET /online/ HTTP/1.1
Host: sublimesilveroldplay.neverssl.com
Host: sublime


# tcpdump -s 0 -A -n -l | egrep -i "POST /|pwd=|passwd=|password=|Host:"

tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp7s0, link-type EN10MB (Ethernet), capture size 262144 bytes
11:25:54.799014 IP 10.10.1.30.39224 > 10.10.1.125.80: Flags [P.], seq 1458768667:1458770008, ack 2440130792, win 704, options [nop,nop,TS val 461552632 ecr 208900561], length 1341: HTTP: POST /wp-login.php HTTP/1.1
.....s..POST /wp-login.php HTTP/1.1
Host: dev.example.com
.....s..log=admin&pwd=notmypassword&wp-submit=Log+In&redirect_to=http%3A%2F%2Fdev.example.com%2Fwp-admin%2F&testcookie=1


# 提取 Set-Cookie（服务端的 Cookie）和 Cookie（客户端的 Cookie）：
# tcpdump -nn -A -s0 -l | egrep -i 'Set-Cookie|Host:|Cookie:'

tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on wlp58s0, link-type EN10MB (Ethernet), capture size 262144 bytes
Host: dev.example.com
Cookie: wordpress_86be02xxxxxxxxxxxxxxxxxxxc43=admin%7C152xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxfb3e15c744fdd6; _ga=GA1.2.21343434343421934; _gid=GA1.2.927343434349426; wordpress_test_cookie=WP+Cookie+check; wordpress_logged_in_86be654654645645645654645653fc43=admin%7C15275102testtesttesttestab7a61e; wp-settings-time-1=1527337439


抓取 HTTP 有效数据包
抓取 80 端口的 HTTP 有效数据包，排除 TCP 连接建立过程的数据包（SYN / FIN / ACK）：

# tcpdump 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'

# 抓HTTP GET数据
tcpdump -i eth1 'tcp[(tcp[12]>>2):4] = 0x47455420'


#  tcpdump -i bond0.1830 -s0 -A -l host 10.253.26.218 | grep -A20 "POST"
#  tcpdump -i bond0.1830 -s0 -A -l host 10.253.141.114 | grep -A20 "SYAN_UNHQ_queryLoginUserInfoForPdByUserId"
```

# vim

```
0 - Move to beginging of line
$ - Move to end of line
gg - Move to first line of file
G - Move to last line of file

w - Move forward to next word
b - Move backward to next word

```

# 网络

# yum

```yaml
# YUM 源配置文件一般在
/etc/yum.repos.d/
文件后缀为 .repo，每个文件代表一个仓库，例如：
CentOS-Base.repo
epel.repo
custom.repo


# 一个 .repo 文件示例：
[base]
name=CentOS-7 - Base
baseurl=http://mirror.centos.org/centos/7/os/x86_64/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-7 - Updates
baseurl=http://mirror.centos.org/centos/7/updates/x86_64/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

# 查看当前系统使用的 YUM 源
yum repolist all
```

# JAVA



## 遇到的坑

### 1.缓存污染

```java
// 缓存污染
    @Override
    public Boolean sendVerifyCode(String userId) {
        //如果用户在期限内已经发送了验证码
        if(safeVerifyUtil.hasCode(userId,null)&&!safeVerifyUtil.checkResendCode(userId,null)){
                throw new CodeVerifyException(CODE_HAS_SEND);
        }
        String code = safeVerifyUtil.generatedcode(6);
        //发送验证码
        UserInfoByUserIdReq userInfoByUserIdReq = new UserInfoByUserIdReq();
        userInfoByUserIdReq.setUserId(userId);
        MopUserInfoDTO mopUserInfoDTO = mopRestService.queryLoginUserInfoForPdByUserId(userInfoByUserIdReq);

        if (null == mopUserInfoDTO) {
            log.error("未查到用户{}的信息",userId);
            throw new CodeVerifyException(USER_IS_NULL_FROM_OP, userId);
        }
        sendMsg(mopUserInfoDTO, code);
        return safeVerifyUtil.saveVerifyCode(code, userId,null,null);
    }



    override fun getUserInfo(userId: String): MopUserInfoDTO {
        //调用mop的3.1.26. 用户信息查询接口
        val userInfoByUserIdReq = UserInfoByUserIdReq()
        userInfoByUserIdReq.userId = userId

        val mopUserInfo = mopRestService.queryLoginUserInfoForPdByUserId(userInfoByUserIdReq)
        mopUserInfo.telephone = if (mopUserInfo.telephone != null) mopUserInfo.telephone.replaceRange(3, 7, "****") else null
        mopUserInfo.email?.let { email ->
            val atIndex = email.indexOf('@')
            if (atIndex > 0) {
                val maskedEmail = "****${email.substring(atIndex)}"
                mopUserInfo.email = maskedEmail
            }
        }
        return mopUserInfo
    }



    @Cached(name = "queryLoginUserInfoForPdByUserId",expire = 15, cacheType = CacheType.LOCAL, timeUnit = TimeUnit.MINUTES)
    @Override
    public MopUserInfoDTO queryLoginUserInfoForPdByUserId(UserInfoByUserIdReq loginUserInfoReq) {
        String url = mopCommonService.buildUrlWithSign(QUERY_LOGIN_USERINFO_BY_USERID);
        log.info("调用方法:{}, 调用参数:{}", QUERY_LOGIN_USERINFO_BY_USERID, JacksonUtils.toString(loginUserInfoReq));

        JSONObject msgJson = mopCommonService.doPost(url, loginUserInfoReq);

        return gson.fromJson(
                JSONObject.fromObject(msgJson.get("body")).toString(),
                new TypeToken<MopUserInfoDTO>() {
                }.getType()
        );
    }



// 接口一和接口二都调用了接口三，但接口二修改了引用对象的telephone,导致接口一无法拿到正确的手机号码
```

