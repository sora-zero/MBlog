# 环境设置

## 安装docker

## 运行redis

配置文件在 config 目录下, 要用绝对路径

`docker run -p 6379:6379 -d -v config/redis.conf:/usr/local/etc/redis/redis.conf --name myredis redis redis-server /usr/local/etc/redis/redis.conf`

## 运行mysql

docker run, 同样要修改为绝对路径

`docker run -p 3306:3306 --name master-mysql -v config/master-my.cnf:/etc/my.cnf -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7.25`

`docker run -p 3307:3306 --name slave-mysql -v config/slave-my.cnf:/etc/my.cnf -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7.25`

master-mysql 创建数据库

`mysql> create database  test CHARACTER SET utf8mb4;`

master-mysql 复制sql文件

`docker cp src/main/webapp/database/microblog.sql master-mysql:.`

master-mysql 初始化数据库

`mysql -u root -p test < ./microblog.sql`

### 设置主从复制
[Setting the Replication Master Configuration](https://dev.mysql.com/doc/refman/5.7/en/replication-howto-masterbaseconfig.html)

查看容器ip地址
`docker inspect master-mysql |grep IPAddress`

修改sql脚本的设置

master_mysql.sql:
* slave-host

slave_mysql.sql:
* master_log_file
* master-host

复制sql脚本到容器

`docker cp scripts/master_mysql.sql master-mysql:.`

`docker cp scripts/slave_mysql.sql slave-mysql:.`

运行sql脚本

`mysql -u root -p test < ./master_mysql.sql`

`mysql -u root -p < ./slave_mysql.sql`
