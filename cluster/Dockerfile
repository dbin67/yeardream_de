FROM ubuntu:20.04

# 3. Java 설치 및 환경설정

# 라이브러리 설치
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade
RUN apt-get install -y vim wget unzip ssh openssh-* net-tools tree
RUN apt install libsnappy-dev -y

# Java 8 설치
RUN apt-get install -y openjdk-8-jdk

# Java 환경변수 설정
RUN JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

# SSH 설정 비밀번호: 1234
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "1234\n1234" | passwd
RUN mkdir -p /run/sshd

EXPOSE 22

# 4. 하둡 에코시스템 베이스 이미지 설치

# Mariadb Client 설치
RUN apt install -y mariadb-client

# Python & PySpark 설치
RUN apt update -y
RUN apt install python3.9 -y
RUN apt install python3-pip -y
RUN pip3 install pyspark findspark

# 플랫폼 설치
RUN mkdir /downloads
WORKDIR /downloads

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.2.4/hadoop-3.2.4.tar.gz
RUN wget https://dlcdn.apache.org/spark/spark-3.2.4/spark-3.2.4-bin-hadoop3.2.tgz
RUN wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.2/apache-zookeeper-3.8.2-bin.tar.gz
RUN wget https://downloads.apache.org/kafka/3.4.1/kafka_2.12-3.4.1.tgz
RUN wget https://downloads.apache.org/hive/hive-3.1.3/apache-hive-3.1.3-bin.tar.gz
RUN wget https://dlcdn.apache.org/zeppelin/zeppelin-0.10.1/zeppelin-0.10.1-bin-all.tgz
RUN wget https://dlcdn.apache.org/flume/1.11.0/apache-flume-1.11.0-bin.tar.gz

# 압축 해제
RUN tar -xzvf hadoop-3.2.4.tar.gz -C /usr/local
RUN tar -xzvf spark-3.2.4-bin-hadoop3.2.tgz -C /usr/local
RUN tar -xzvf apache-zookeeper-3.8.2-bin.tar.gz -C /usr/local
RUN tar -xzvf kafka_2.12-3.4.1.tgz -C /usr/local
RUN tar -xzvf apache-hive-3.1.3-bin.tar.gz -C /usr/local/
RUN tar -zxvf zeppelin-0.10.1-bin-all.tgz -C /usr/local/
RUN tar -xzvf apache-flume-1.11.0-bin.tar.gz -C /usr/local

# 심볼릭 링크 생성
WORKDIR /usr/local
RUN ln -s hadoop-3.2.4 hadoop
RUN ln -s spark-3.2.4-bin-hadoop3.2 spark
RUN ln -s apache-zookeeper-3.8.2-bin zookeeper
RUN ln -s kafka_2.12-3.4.1 kafka
RUN ln -s apache-hive-3.1.3-bin hive
RUN ln -s zeppelin-0.10.1-bin-all zeppelin
RUN ln -s apache-flume-1.11.0-bin flume

# 소유권 변경
RUN chown -R $USER:$USER /usr/local/

# 환경변수 설정
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-openjdk-amd64/bin:/usr/local/hadoop/bin:/usr/local/hadoop/sbin:/usr/local/spark/bin:/usr/local/spark/sbin:/usr/bin/python3:/usr/local/zookeeper/bin:/usr/local/kafka/bin:/usr/local/hive/bin:/usr/local/zeppelin/bin:/usr/local/flume/bin"
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
ENV HADOOP_HOME="/usr/local/hadoop"
ENV SPARK_HOME="/usr/local/spark"
ENV ZOOKEEPER_HOME="/usr/local/zookeeper"
ENV KAFKA_HOME="/usr/local/kafka"
ENV HIVE_HOME="/usr/local/hive"
ENV ZEPPELIN_HOME="/usr/local/zeppelin"

# Hive MySQL Connector
WORKDIR /downloads
RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.27.tar.gz
RUN tar xvfz mysql-connector-java-5.1.27.tar.gz
RUN cp mysql-connector-java-5.1.27/*.jar $HIVE_HOME/lib

# 하둡과의 Guava 파일 버전 충돌 문제 해결
RUN rm $HIVE_HOME/lib/guava-19.0.jar
RUN cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib/

RUN rm -rf /downloads

# 5. 하둡 설정

RUN mkdir -p ${HADOOP_HOME}/pids

ADD conf/hadoop/ $HADOOP_HOME/etc/hadoop/

# 6. 주키퍼 설정

ADD conf/zookeeper/zoo.cfg $ZOOKEEPER_HOME/conf/zoo.cfg

RUN mkdir -p /usr/local/zookeeper/data
RUN mkdir -p /usr/local/zookeeper/logs

ADD conf/zookeeper/myid $ZOOKEEPER_HOME/data/myid

# 7. 스파크 설정

ADD conf/spark/ $SPARK_HOME/conf/

# 8. 카프카 설정

ADD conf/kafka/ $KAFKA_HOME/config/
RUN mkdir -p /usr/local/kafka/logs

CMD ["/usr/sbin/sshd", "-D"]