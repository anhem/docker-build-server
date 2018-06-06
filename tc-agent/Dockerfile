FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# install dependencies
RUN apt-get update && apt-get install -y wget unzip ecryptfs-utils mhddfs npm samba samba-common-bin

# install chrome
RUN wget https://dl.google.com/linux/linux_signing_key.pub
RUN apt-key add linux_signing_key.pub
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install -y google-chrome-stable

# install jdk
RUN mkdir /usr/local/java
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -P /usr/local/java http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.tar.gz
RUN tar xvzf /usr/local/java/jdk-10.0.1_linux-x64_bin.tar.gz -C /usr/local/java && rm /usr/local/java/jdk-10.0.1_linux-x64_bin.tar.gz
ENV JAVA_HOME /usr/local/java/jdk-10.0.1

VOLUME /opt/buildAgent

ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9090
