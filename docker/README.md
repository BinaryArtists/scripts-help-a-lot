# Docker 使用

## [安装mysql](https://www.cnblogs.com/notejava/p/7124189.html)

> 拉取mysql镜像，采用网易加速地址

```
docker pull hub.c.163.com/library/mysql:5.7
```

> 重命名镜像名

```
docker tag hub.c.163.com/library/mysql:5.7 mysql:5.7
```

> 查看镜像

```
docker images
```

> 启动一个mysql镜像的容器，输入下面的命令：

```
docker run -itd -P mysql bash

docker run : 启动一个容器
-itd：i是交互式操作，t是一个终端，d指的是在后台运行
-P 指在本地生成一个随机端口，用来映射mysql的3306端口
mysql：刚才下的mysql镜像名
bash：指创建一个交互式shell

docker run --name mysql5.7 -p 3306:3306 -v /docker/mysql/datadir:/var/lib/mysql -v /docker/mysql/conf.d:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
```

> 查看已经运行的镜像：

```
docker ps -a
```

> 进入容器：

docker exec -it distracted_hodgkin bash

> 这样我们就进入到了镜像当中了，我们来看下mysql的启动状态：

service mysql status

如果发现mysql未启动，可以动过命令进行启动：

service mysql start

## 配置Mysql
首先我们先将账号root的密码修改下：

update user set authentication_string ='123456' where user = 'root';

由于mysql默认root是默认绑定在localhost上的，权限不够，所以修改下对应的root权限：

GRANT ALL PRIVILEGES ON . TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;

> 停止/启动你的容器：

docker stop distracted_hodgkin
docker start distracted_hodgkin

> 由于之前启动时是自定义的端口，每次容器启动时端口就会变化，所以最好映射一个指定端口：

首先提交运行中的容器为一个镜像（这样不会丢失在容器的各种操作）

docker commit distracted_hodgkin mysql_test

> distracted_hodgkin: 运行中的容器名
mysql_test：生成的镜像名词
然后运行镜像并指定对应的端口：

docker run -d -it -p 13306:3306 mysql_test:latest /bin/bash

> 这样以后可以使用最新生成的容器，端口就不会变了，或者你可以删除掉你的容器，在创建容器时就指定端口（上面的步骤重新来一遍）

docker rm distracted_hodgkin


























> 创建docker用户组

```
sudo groupadd docker
```

> 应用用户加入docker用户组


```
sudo usermod -aG docker ${USER}
```

> 重启docker服务

```
sudo systemctl restart docker
```

> 切换或者退出当前账户再从新登入

```
su root             切换到root用户
su ${USER}          再切换到原来的应用用户以上配置才生效
```

> 创建用于挂载的目录

```
sudo mkdir -p /my/mysql/datadir #用于挂载mysql数据文件
sudo mkdir -p /my/mysql/conf.d #用于挂载mysql配置文件
sudo chown yaoren:docker /my #修改/my目录拥有者
```

