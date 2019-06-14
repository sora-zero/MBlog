# 环境设置

## 安装docker

## 运行redis

配置文件在 config 目录下

`docker run -p 6379:6379 -d -v /redis.conf:/usr/local/etc/redis/redis.conf --name myredis redis redis-server /usr/local/etc/redis/redis.conf`

## 运行mysql

`docker run -p 3306:3306 --name spring-mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7.25`

创建数据库
`mysql> create database test;`

复制sql文件
`docker cp microblog.sql spring-mysql:.`

运行sql脚本
`mysql -u root -p test < ./microblog.sql`

