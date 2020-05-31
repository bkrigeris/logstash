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
: this is what docker engine is using to build the container image. It contains instructions for base image and addtional files that are added image container.

## Usage

TODO: Write usage instructions

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