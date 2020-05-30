FROM docker.elastic.co/logstash/logstash:7.7.0
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD logstash.conf /usr/share/logstash/pipeline/
ADD logstash.yml /usr/share/logstash/config/

EXPOSE 9600/tcp
EXPOSE 5044/udp