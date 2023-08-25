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

# 16. Spark 클러스터 실행 및 PySpark 예제 실행

$SPARK_HOME/sbin/start-all.sh

# 17. Kafka 클러스터 설정 및 실행

ssh slave1 "$KAFKA_HOME/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties"

ssh slave2 "$KAFKA_HOME/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties"

ssh slave3 "$KAFKA_HOME/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties"

/usr/sbin/sshd -D