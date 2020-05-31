# Project Name: Lightweight Log Collector

## Objective of ths project

This object of this project is to have a lightweight, easy to install and deploy syslog or any other type of log collector. The core installation behind this container is Logstash, a part of Elastic Stack. 

## Target audience for this project

While this container is not designed for a large scale deployment, it can be spun up quickly and easily to stand up a log collecor to help a network engineer or system administrator capture logs and send them to a remote system. This is especially helpful when troubleshooting Cisco IOS devices that don't retain logs on reboot or have a small syslog buffers.

## Prerequisites

### Docker
Install Docker on the system where you'll build and run the container. Instructions for your operating system can be found @ <https://docs.docker.com/get-docker/>

### Git Client
Git installation can be found @ <https://www.atlassian.com/git/tutorials/install-git>


## Building Docker Container

### Components
Dockerfile 
:  this is what docker engine is using to build the container image. It contains instructions for base image and addtional files that are added image container. Complete reference can be found @ <https://docs.docker.com/engine/reference/builder/>

logstash.yml
:  a file that defines logstash configuration settings. Complete reference can be found @ <https://www.elastic.co/guide/en/logstash/current/index.html>

logstash.conf
:  a file that defines logstash operational settings for input, filter and output configuration. Complete reference can be found @ <https://www.elastic.co/guide/en/logstash/current/index.html>

README.md
:  instructions on how to install and run this container

### Creating a container image

Clone the directory and change into the directory that contains all four files. Do not forget the period at the end of the command.

<pre><code>docker build -t logstash:latest . </code></pre>

## Running the logging container

<pre><code>docker run --rm -d \
--name logstash-server \
-p 9600:9600/tcp -p 5000:5000/tcp -p 5000:5000/udp \
-v ~/logstashlog:/usr/share/logstash/logstashlog/ \
logstash:latest logstash </code></pre>

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

TODO: Write history

## Credits

TODO: Write credits

## License

TODO: Write license