# Project Name: Lightweight Log Collector

## Objective of this project

This object of this project is to have a lightweight, easy to install and deploy syslog or any other type of log collector. The core installation behind this container is Logstash, a part of Elastic Stack. 

## Target audience for this project

While this container is not designed for enterprise usage, it can be spun up quickly and easily to stand up a log collector to help a network engineer or system administrator capture logs and send them to a remote system. This is especially helpful when troubleshooting Cisco IOS devices that don't retain logs on reboot or have a small syslog buffers.

## Prerequisites

### Docker
Install Docker on the system where you'll build and run the container. Instructions for your operating system can be found @ <https://docs.docker.com/get-docker/>

### Git Client
Git installation can be found @ <https://www.atlassian.com/git/tutorials/install-git>


## Building Docker Container

### Components
Dockerfile 
:  this is what docker engine is using to build the container image. It contains instructions for base image and additional files that are added image container. Complete reference can be found @ <https://docs.docker.com/engine/reference/builder/>

logstash.yml
:  a file that defines logstash configuration settings. Complete reference can be found @ <https://www.elastic.co/guide/en/logstash/current/index.html>

logstash.conf
:  a file that defines logstash operational settings for input, filter and output configuration. Complete reference can be found @ <https://www.elastic.co/guide/en/logstash/current/index.html>

README.md
:  instructions on how to install and run this container

### Creating a container image

Clone the directory and change into the directory that contains all four files. Do not forget the period at the end of the command.

<pre><code>docker build -t logstash:7.7.0 . </code></pre>

## Running the logging container

<pre><code>docker run --rm -d \
--name logstash-server \
-p 9600:9600/tcp -p 5000:5000/tcp -p 5000:5000/udp \
-v ~/logstashlog:/usr/share/logstash/logstashlog/ \
logstash:7.7.0 logstash </code></pre>

### Breakdown of the docker run command
-rm will delete the container after it is stopped and -d will run headless <pre><code>docker run --rm -d \ </code></pre> 
--name names the container <pre><code>--name logstash-server \ </code></pre> 
exposes ports on the host machine. tcp 9600 is used for monitoring, tcp/udp 5000 is used for receiving log messages <pre><code>-p 9600:9600/tcp -p 5000:5000/tcp -p 5000:5000/udp \ </code></pre> 
-v flag mounts a directory on host machine to a directory on the docker container. Since container is destroyed after it is stopped, the logs will be saved directly to the host machine. More information on persistent volumes @ <https://docs.docker.com/storage/bind-mounts/> <pre><code>-v ~/logstashlog:/usr/share/logstash/logstashlog/ \ </code></pre> 
specify the docker image and service to start <pre><code>logstash:7.7.0 logstash </code></pre> 

## Stopping the container

<pre><code>docker stop logstash-server</code></pre>

## Monitoring health of logstash from host machine

CURL command will output health of the logstash service<pre><code>curl -XGET 'localhost:9600/?pretty'</code></pre>

Output
<pre><code>
{
  "host" : "09de68af23f2",
  "version" : "7.7.0",
  "http_address" : "0.0.0.0:9600",
  "id" : "c590a1b7-57f7-46f4-8f63-0032ab43bc20",
  "name" : "09de68af23f2",
  "ephemeral_id" : "cd4a1774-19ba-44fe-b4f1-8328fb449a1d",
  "status" : "green",
  "snapshot" : false,
  "pipeline" : {
    "workers" : 2,
    "batch_size" : 125,
    "batch_delay" : 50
  },
  "build_date" : "2020-05-12T04:34:14+00:00",
  "build_sha" : "d8ed01157be10d78e9910f1fb21b137c5d25529e",
  "build_snapshot" : false
}%
</code></pre>

## Testing the setup
An easy way to test the container is to use Netcat to send a message to Logstash from the host machine. If doing from a remote device, substitute localhost IP 127.0.0.1 with IP address of the host the container is running on.
<pre><code>echo "message" | nc 127.0.0.1 5000</code></pre> 

Logs will output to ~/logstashlog/logstash.out and the file will be created when the first message arrives. After that you can tail -f logstash.out for newly arrived messages

## Notes
While the log collector configuration is basic and primitive, additional and complex features can be added by manipulating logstash.conf file. 
