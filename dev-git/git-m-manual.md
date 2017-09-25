why
审计发现很多开发者配置的是我们无法识别的私人邮箱，导致进行log审计时识别困难，也不利于团队沟通。很多团队老大也反应了此问题。 为加强规范和安全，git服务端对author信息合法性进行了强制性校验。对非法的私人邮箱将拒绝push。

如何修改git库的author
有时候，忘了做git config设置或config的email不规范，导致git log中author不对，造成沟通困难。 此时，你可以遵循如下步骤，修改author信息：

1、首先，你需要设置正确的user.name和user.email信息，注：请务必使用公司邮箱（gitlab用户请和证书邮箱保持一致，否则无法push,请打开gitlab.alibaba-inc.com 点击右上角的profile，看看自己的邮箱是什么）

git config --global user.name "你的花名"
git config --global user.email "你的公司邮箱"
注：去掉--global参数是单独为当前项目设置
2、设置好后，修改你前面已提交的不正确的信息：

 linux下在库根目录运行命令： git-m （linux用户请先安装此命令：sudo yum install git-m -b test)
 1）向导会让你输入需要修正的email（括弧内提示会自动给你找到不规范的email，你可以直接回车）
 2）输入需要替换成正确的用户名
 3）输入需要替换成正确的email（公司邮箱）
此时，程序会自动找出所有不合规范email的，并试图自动修复你本地尚未push的修改。

3、对不支持rpm的用户，可以通过wget http://rpm.corp.taobao.com/git-m 来获取git-m命令。

4、如果没修改成功，则参阅后文的【手工解决】一节的修复方法了（提供了3种方法）

关于git-m
git-m是雪江制作的封装了git filter-branch --commit-filter操作的专门用户修改author信息的工具。

安装
1、linux下的安装方法：sudo yum install git-m -b test -y

2、windows用户如果安装了命令行git(msysgit)下载，可以在项目库代码库根目录下运行(更新于2013-1-4)：

curl  http://rpm.corp.taobao.com/git-m  -o git-m
获得git-m命令，然后在命令行下直接运行git-m(在项目代码库根目录下)或者./git-m。
3、ubuntu/mac等其他平台的用户，可以通过windows一样的命令或者运行下列代码安装。

wget  http://rpm.corp.taobao.com/git-m
chmod 777 git-m
./git-m
使用
安装git-m后，参阅上面章节使用

手工解决
其他处理办法：

1、如果是最新的版本有这个非法邮箱，你可以如下指令重新修订作者信息：

git commit --amend --reset-author
或者用git reset命令重置指向，然后重新commit:

git reset --soft HEAD~1   #退回上一个版本,保留变化
2、也可以手工运行如下代码（不是很方便）： git-m实际代码是：

git filter-branch -f --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "the old email" ];
       then
                GIT_AUTHOR_NAME="your name";
                GIT_AUTHOR_EMAIL="your new email";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' -- 你的版本^..HEAD HEAD
其中这个【你的版本】（后面要跟^尖号），是你没有push过的，本地提交的第一个版本（注意，不要写已经push过的版本）。

逻辑是，找到历史中的不合规email，然后用新的去替换。windows用户，请自己修改其中的参数。

3.还不行的话，用git-m -f参数指令或者将上面的指令稍作修改(最后一行），会修改你当前分支的所有版本，包括已经push过的（这个操作前，请确认其他人没有使用这个分支。如果使用了，则需要他们重新clone代码库--因为历史已经发生了改变）：

git-m -f
或者手工运行如下代码（替换其中相关关键字）：

git filter-branch -f --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "the old email" ];
       then
                GIT_AUTHOR_NAME="your name";
                GIT_AUTHOR_EMAIL="your new email";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD
4. 如果是仓库迁移到阿里Github中，可能存在大量不正常的邮箱，需要进行批量处理，这时可以像下面这样操作：

git filter-branch -f --commit-filter '
echo $GIT_AUTHOR_EMAIL | grep -E -q -v "@alibaba-inc.com|@taobao.com|@tmall.com|@alipay.com|@aliyun-inc.com|@tudou.com|@youku.com"
if [[ $? -eq 0 ]]; then
	GIT_AUTHOR_EMAIL="${GIT_AUTHOR_NAME}@alibaba-inc.com";
fi
git commit-tree "$@";
' HEAD
需要注意的是这只是为了通过检测，并没有保证邮箱有有效性，因为是直接使用Git配置中`usr.name`做为邮箱中的用户名。

修改完后可通过以下命令来验证是否执行正常：

git log --pretty=%aE|grep -E -v "@alibaba-inc.com|@taobao.com|@tmall.com|@alipay.com|@aliyun-inc.com|@tudou.com|@youku.com"|sort -u
FAQ
1、问：git-m 时报错："Cannot rewrite branch(es) with a dirty working directory." 使得author修改失败，如何解决。

答：有2种可能，一是你本地有没有暂存的修改。此时运行：git stash进行暂存，或者git commit将修改提交；再git-m即可。
  
二是如果运行git status发现本地是干净的，还是报这个错的话，是git 1.7.1的一个bug，意味着git没能刷新内部索引。
此时运行如下命令：git update-index -q --ignore-submodules --refresh 对索引进行刷新。
然后再运行git-m命令进行修改应该就可以了。
2、问：我把 git-m 拷贝到 PATH 中去，运行时报 permission denied: git-m 。

答：git-m 权限不足，运行 chmod 777 git-m 进行修复。
3、问：如果是外部开源导入项目

答：请直接在项目设置去掉 email check