#!/bin/bash

# 14. Zookeeper 클러스터 실행

echo 2 > /usr/local/zookeeper/data/myid
/usr/local/zookeeper/bin/zkServer.sh start

# 15. Hadoop & Yarn 클러스터 실행

hdfs --daemon start journalnode
hdfs namenode -bootstrapStandby
hdfs --daemon start namenode

/usr/sbin/sshd -D