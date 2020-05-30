FROM debian:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y wget apt-utils apt-transport-https gnupg2 default-jre default-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/bin/java
ENV JAVA_VER 11
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update && apt-get install -y logstash
