# pull the logstash docker from Elastic's docker registry
FROM docker.elastic.co/logstash/logstash:7.7.0

# remove default logstash.conf file
RUN rm -f /usr/share/logstash/pipeline/logstash.conf

# add logstash files from local directory
ADD pipeline/logstash.conf /usr/share/logstash/pipeline/
ADD config/logstash.yml /usr/share/logstash/config/

#set ports to be exposed
EXPOSE 9600/tcp
EXPOSE 5000/udp
EXPOSE 5000/tcp