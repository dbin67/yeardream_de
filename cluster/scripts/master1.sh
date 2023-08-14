#!/bin/bash

# 14. Zookeeper 클러스터 실행

/usr/local/zookeeper/bin/zkServer.sh start
hdfs zkfc -formatZK

# 15. Hadoop & Yarn 클러스터 실행

hdfs --daemon start journalnode
hdfs namenode -format
hdfs --daemon start namenode
start-dfs.sh
start-yarn.sh
mapred --daemon start historyserver

/usr/sbin/sshd -D