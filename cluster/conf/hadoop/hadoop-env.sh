# Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-arm64

# Hadoop
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_COMMON_LIB_NATIVE_DIR=${HADOOP_HOME}/lib/native
export HADOOP_OPTS="${HADOOP_OPTS} -Djava.library.path=$HADOOP_HOME/lib/native"

# For PID
# hadoop-USER-datanode.pid (DataNode)
# hadoop-USER-journalnode.pid (JournalNode)
# hadoop-USER-namenode.pid (NameNode)
# hadoop-USER-zkfc.pid (DFSZKFailoverController)
export HADOOP_PID_DIR=${HADOOP_HOME}/pids
export HADOOP_SECURE_PID_DIR=${HADOOP_PID_DIR}

export HDFS_NAMENODE_USER=root
export HDFS_DATANODE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root
export YARN_RESOURCEMANAGER_USER=root
export YARN_NODEMANAGER_USER=root
export HDFS_JOURNALNODE_USER=root
export HDFS_ZKFC_USER=root