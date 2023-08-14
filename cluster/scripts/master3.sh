#!/bin/bash

# 14. Zookeeper 클러스터 실행

echo 3 > /usr/local/zookeeper/data/myid
/usr/local/zookeeper/bin/zkServer.sh start

# 15. Hadoop & Yarn 클러스터 실행

hdfs --daemon start journalnode

/usr/sbin/sshd -D