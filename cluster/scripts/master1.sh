#!/bin/bash

/usr/local/zookeeper/bin/zkServer.sh start

hdfs zkfc -formatZK

/usr/sbin/sshd -D