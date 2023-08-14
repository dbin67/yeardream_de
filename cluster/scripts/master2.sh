#!/bin/bash

echo 2 > /usr/local/zookeeper/data/myid

/usr/local/zookeeper/bin/zkServer.sh start

/usr/sbin/sshd -D