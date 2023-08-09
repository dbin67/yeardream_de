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

CMD ["/usr/sbin/sshd", "-D"]