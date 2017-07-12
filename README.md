# CUDCOS_containerization_mysql
mysql容器主从节点的启动

修改/mysql-master/my.cnf

注意log-bin, server-id的设置
注意创建replication用户的SQL语句

```Bash
docker build -t /mysql-master/Dockerfile
docker build -t /mysql-slave/Dockerfile

最后检查

docker images | grep mysql

```
