#!/bin/bash

# 17. Kafka 클러스터 설정 및 실행

echo "" >> /usr/local/kafka/config/server.properties
echo "broker.id=1" >> /usr/local/kafka/config/server.properties
echo "advertised.listeners=PLAINTEXT://slave1:9092" >> /usr/local/kafka/config/server.properties

/usr/sbin/sshd -D