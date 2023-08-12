echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
echo 'export HADOOP_HOME=/usr/local/hadoop' >> ~/.bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop' >> ~/.bashrc
echo 'export HADOOP_YARN_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export SPARK_HOME=/usr/local/spark' >> ~/.bashrc
echo 'export PYTHONPATH=/usr/bin/python3' >> ~/.bashrc
echo 'export PYSPARK_PYTHON=/usr/bin/python3' >> ~/.bashrc
echo 'export ZOOKEEPER_HOME=/usr/local/zookeeper' >> ~/.bashrc
echo 'export KAFKA_HOME=/usr/local/kafka' >> ~/.bashrc
echo 'export KAFKA_HEAP_OPTS="-Xmx512m -Xms512m"' >> ~/.bashrc
echo 'export HIVE_HOME=/usr/local/hive' >> ~/.bashrc
echo 'export ZEPPELIN_HOME=/usr/local/zeppelin' >> ~/.bashrc

source ~/.bashrc
