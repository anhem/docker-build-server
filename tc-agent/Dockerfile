FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

# install dependencies
RUN apt-get update && \
    apt-get install -y sudo wget unzip openjdk-8-jdk git maven ecryptfs-utils mhddfs samba samba-common-bin whois acl

# install openJDK 11
RUN wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
RUN tar -xvf openjdk-11.0.2_linux-x64_bin.tar.gz
RUN mkdir -p /usr/lib/jvm/jdk-11-manual/
RUN mv jdk-11*/* /usr/lib/jvm/jdk-11-manual/
RUN sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-11-manual/bin/java 1
RUN sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-11-manual/bin/javac 1

# install chrome
RUN wget https://dl.google.com/linux/linux_signing_key.pub
RUN apt-key add linux_signing_key.pub
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN apt-get update && \
    apt-get install -y google-chrome-stable && \
    apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

VOLUME /opt/buildAgent

ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD tail -f /dev/null

EXPOSE 9090
