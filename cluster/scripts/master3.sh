#!/bin/bash

echo 3 > /usr/local/zookeeper/data/myid

/usr/local/zookeeper/bin/zkServer.sh start

/usr/sbin/sshd -D