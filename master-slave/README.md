# CUDCOS_containerization_mysql
## mysql容器主从节点的启动

修改master-slave/mysql-master/my.cnf

== 注意log-bin, server-id的设置
注意创建replication用户的SQL语句 ==

```Bash
docker build -t master-slave/mysql-master/Dockerfile
docker build -t master-slave/mysql-slave/Dockerfile

最后检查

docker images | grep mysql

```

```Bash
kubectl create -f mysql-master-service.yaml
kubectl create -f mysql-master-pod.yaml

kubectl create -f mysql-slave-service.yaml
kubectl create -f mysql-slave-rc.yaml
```
验证服务、RC、Pod都正确创建并运行：


```Bash
# kubectl get svc,rc,pods
NAME                CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
mysql-master        169.169.63.26    <none>        3306/TCP   1h
mysql-slave         169.169.224.20   <none>        3306/TCP   1h

NAME                DESIRED          CURRENT       AGE
mysql-slave         2                2             21s

NAME                READY            STATUS        RESTARTS   AGE
mysql-master        1/1              Running       0          47s
mysql-slave-4ih5t   1/1              Running       0          21s
mysql-slave-j1crk   1/1              Running       0          21s
```

