# README

## START Cluster

```make```

## SSH Connection

### container ssh ports & password
|container name|port|password|
|:---|---:|:---:|
|master1|221|1234|
|master2|222|1234|
|master3|223|1234|
|slave1|224|1234|
|slave2|225|1234|
|slave3|226|1234|

### connection

#### root

```ssh -p [container ssh port] root@localhost```

#### user

```ssh -p [container ssh port] ubuntu@localhost```
