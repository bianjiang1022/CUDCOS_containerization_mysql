# CUDCOS_containerization_mysql

## mysql容器pxc节点的启动


镜像下载

```Bash
docker pull capttofu/percona_xtradb_cluster_5_6
```

创建服务

```Bash
kubectl create -f  /multi-master-slave/pxc-cluster-service.yaml
```

创建一个主节点

```Bash
kubectl create -f  /multi-master-slave/pxc-node1.yaml
```

创建后续节点

```Bash
kubectl create -f  /multi-master-slave/pxc-node2.yaml
kubectl create -f  /multi-master-slave/pxc-node3.yaml
```
== 注：Service和RC应同时创建； 如果仅有Service而无后端Endpoint，SST过程会失败，Node将自动停止，导致Pod停止，会被RC不断重启 ==

