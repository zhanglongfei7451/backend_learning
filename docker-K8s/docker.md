## docker常用指令

| docker          |                          |
| ---------------------- | ------------------------ |
| docker images          | 列出本地主机上的镜像     |
| docker search 镜像名称 | 从 docker hub 上搜索镜像 |
| docker pull 镜像名称   | 从docker hub 上下载镜像  |
| docker rmi 镜像名称    | 删除本地镜像   |
| docker rm  容器名称 | 删除容器 |
| docker ps | 查看当前运行中的镜像 |
| docker start/stop container_id | 启动或者停止指定id的容器 |
|     |    |
|     |    |
|     |    |
|     |    |
|     |    |

## docker-file

一般来说，我们可以将 `Dockerfile` 分为四个部分：

- **基础镜像(父镜像)信息指令 `FROM`**
- **维护者信息指令 `MAINTAINER`**
- **镜像操作指令 `RUN` 、 `EVN` 、 `ADD` 和 `WORKDIR` 等**
- **容器启动指令 `CMD` 、 `ENTRYPOINT` 和 `USER` 等**

```python
FROM python:2.7
# FROM 是用于指定基础的 images ，一般格式为 FROM <image> or FORM <image>:<tag> ，所有的 Dockerfile 都用该以 FROM 开头，FROM 命令指明 Dockerfile 所创建的镜像文件以什么镜像为基础，FROM 以后的所有指令都会在 FROM 的基础上进行创建镜像。可以在同一个 Dockerfile 中多次使用 FROM 命令用于创建多个镜像。比如我们要指定 python 2.7 的基础镜像
MAINTAINER Angel_Kitty <angelkitty6698@gmail.com>
# MAINTAINER用于指定镜像创建者和联系方式
COPY . /app
# COPY 是用于复制本地主机的 <src> (为 Dockerfile 所在目录的相对路径)到容器中的 <dest>。
# 当使用本地目录为源目录时，推荐使用 COPY 。一般格式为 COPY <src><dest> 。如我们要拷贝当前目录到容器中的 /app 目录下，我们可以这样操作
WORKDIR /app
# WORKDIR 用于配合 RUN，CMD，ENTRYPOINT 命令设置当前工作路径。可以设置多次，如果是相对路径，则相对前一个 WORKDIR 命令。默认路径为/。一般格式为 WORKDIR /path/to/work/dir
RUN pip install -r requirements.txt
# RUN 用于容器内部执行命令。每个 RUN 命令相当于在原有的镜像基础上添加了一个改动层，原有的镜像不会有变化
EXPOSE 5000
# EXPOSE 命令用来指定对外开放的端口
ENTRYPOINT ["python"]
# ENTRYPOINT 可以让你的容器表现得像一个可执行程序一样。一个 Dockerfile 中只能有一个 ENTRYPOINT，如果有多个，则最后一个生效
CMD ["app.py"]
# CMD 命令用于启动容器时默认执行的命令，CMD 命令可以包含可执行文件，也可以不包含可执行文件。不包含可执行文件的情况下就要用 ENTRYPOINT 指定一个，然后 CMD 命令的参数就会作为ENTRYPOINT的参数
# 一个 Dockerfile 中只能有一个CMD，如果有多个，则最后一个生效。而 CMD 的 shell 形式默认调用 /bin/sh -c 执行命令。
# CMD 命令会被 Docker 命令行传入的参数覆盖：docker run busybox /bin/echo Hello Docker 会把 CMD 里的命令覆盖
'''
我们可以分析一下上面这个过程：
1、从 Docker Hub 上 pull 下 python 2.7 的基础镜像
2、显示维护者的信息
3、copy 当前目录到容器中的 /app 目录下 复制本地主机的 <src> ( Dockerfile 所在目录的相对路径)到容器里 <dest>
4、指定工作路径为 /app
5、安装依赖包
6、暴露 5000 端口
7、启动 app
'''

# Dockerfile，需要定义一个Dockerfile，Dockerfile定义了进程需要的一切东西。Dockerfile涉及的内容包括执行代码或者是文件、环境变量、依赖包、运行时环境、动态链接库、操作系统的发行版、服务进程和内核进程(当应用进程需要和系统服务和内核进程打交道，这时需要考虑如何设计namespace的权限控制)等等  


```

## 数据卷

```python
docker run -it -v /宿主机绝对路径:/容器内目录 镜像名
# 在宿主机的根目录下会多出对应的文件夹
# 然后在容器的根目录下也会出现对应的文件夹
# 通过inspect命令可以查询容器的详情
数据共享的操作
# 宿主机添加对应的文件，容器中可以同步看到，然后在容器中修改数据
# 停掉容器后数据还在


dockerfile中添加
# volume test
FROM centos
VOLUME ["/dataVolumeContainer1","/dataVolumeContainer2"]
CMD echo "finished,--------success1"
CMD /bin/bash
# 根据这个dockerfile构建我们的镜像
docker build -f dockerFile1 -t bobo/centos .
```

https://www.yuque.com/leifengyang/oncloud/mbvigg