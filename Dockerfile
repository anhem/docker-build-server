FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget unzip

# install jdk
RUN mkdir /usr/local/java
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -P /usr/local/java http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz
RUN tar xvzf /usr/local/java/jdk-8u77-linux-x64.tar.gz -C /usr/local/java && rm /usr/local/java/jdk-8u77-linux-x64.tar.gz
ENV JAVA_HOME /usr/local/java/jdk1.8.0_77

VOLUME /opt/buildAgent

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9090
