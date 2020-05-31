FROM docker.elastic.co/logstash/logstash:7.7.0
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD logstash.conf /usr/share/logstash/pipeline/
ADD logstash.yml /usr/share/logstash/config/
#CMD touch /usr/share/logstash/logstash.out

EXPOSE 9600/tcp
EXPOSE 5000/udp
EXPOSE 5000/tcp