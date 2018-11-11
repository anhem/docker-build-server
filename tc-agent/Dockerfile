FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

# install dependencies
RUN apt-get update && \
    apt-get install -y sudo wget unzip openjdk-11-jdk git maven ecryptfs-utils mhddfs samba samba-common-bin whois acl

# install chrome
RUN wget https://dl.google.com/linux/linux_signing_key.pub
RUN apt-key add linux_signing_key.pub
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN apt-get update && \
    apt-get install -y google-chrome-stable && \
    apt-get clean

VOLUME /opt/buildAgent

ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD tail -f /dev/null

EXPOSE 9090
