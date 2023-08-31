## Git
git init 初始化
git log
git log --pretty=oneline
git log --graph
git reflog
git add .  全部加入，也可以加一个文件名字
git commit -m '注释内容‘    暂存区内容到本地仓库
git status'
git reset --hard commitID 版本回退

git branch    查看分支
git branch 分支名      创建本地分支
git checkout 分支名      切换分支
git merge     分支名称
git branch -d 删除分支
git branch -r 查看远程分支

git remote add <远端名称，默认origin> <仓库路径>   初始化本地仓库并于已创建的远程仓库连接
git remote 查看远程仓库
git push [-f] [--set-upstream] [远端名称 [本地分支名][:远端分支名] ]
远程分支和本地分支名称相同，则可以只写本地分支git push origin master;-f表示强制覆盖，--set-upstream 推送到远端的同时并且建立起和远端分支的关联关系git push --set-upstream origin master；如果当前分支已经和远端分支关联，则可以省略分支名和远端名。git push 将master分支推送到已关联的远端分支。
git branch -vv 查看本地分支和远端分支的关联
如果已经有一个远端仓库，我们可以直接clone到本地。
命令: git clone <仓库路径> [本地目录]
本地目录可以省略，会自动生成一个目录
git clone -b <指定分支名> <远程仓库地址>

 % 远程分支和本地分支名字最好保持一致，不然会有许多bug搞不清楚
#将本地分支上传到远端，同时关联newbranch和远端branch分支
git push --set-upstream origin newbranch:origin/branch
其中 origin是远程仓库别名，newbranch 是本地分支名 origin/branch是远程分支名

#将本地newbranch分支与远端branch分支关联。这种方式最为直接
git branch --set-upstream-to=origin/branch newbranch
git branch --unset-upstream 撤销分支关联
git push origin master     上传本地仓库到已关联的远端分支

远程分支和本地的分支一样，我们可以进行merge操作，只是需要先把远端仓库里的更新都下载到本地，再进行操作
git fetch [remote name] [branch name] 抓取指令就是将仓库里的更新都抓取到本地，不会进行合并
git pull [remote name] [branch name]
拉取指令就是将远端仓库的修改拉到本地并自动进行合并，等同于fetch+merge -

git pull origin main --allow-unrelated-histories 

//查询当前远程的版本
git remote -v
//获取最新代码到本地
git fetch origin master  [示例1：获取远端的origin/master分支]
git fetch origin dev [示例2：获取远端的origin/dev分支]
//查看版本差异
git log -p master..origin/master [示例1：查看本地master与远端origin/master的版本差异]
git log -p dev..origin/dev   [示例2：查看本地dev与远端origin/dev的版本差异]
//合并最新代码到本地分支
git merge origin/master  [示例1：合并远端分支origin/master到当前分支]
git merge origin/dev [示例2：合并远端分支origin/dev到当前分支]
最后在gitpush

注：
git pull和git fetch的区别
git  pull(拉取)  即从远程仓库抓取本地没有的修改并【自动合并】到远程分支     git pull origin master
git  fetch(提取) 从远程获取最新版本到本地不会自动合并   git fetch  origin master   
git diff 查看同一个文件的冲突



合并，合并的是历史操作




ssh-keygen -t rsa -C “1527732688@qq.com” -f ~/.ssh/github_rsa
#注意替换为自己注册的邮箱
ssh-keygen -t rsa -C "zhanglongfei@cmss.chinamobile.com”
#注意替换成自己的名字和邮箱
git config --global user.name "zhanglongfei"
git config --global user.email "zhanglongfei@cmss.chinamobile.com"

git config --global user.name

cd ../返回上级目录
dir查看当前所有目录