# docker-cloudbot

Dockerized version of the great Python based IRC bot [CloudBot](https://github.com/CloudBotIRC/CloudBot).

### Installation

1. Clone repository:  
  `git clone https://github.com/frdmn/docker-cloudbot.git /opt/docker-cloudbot`
1. Adjust configuration:  
  `cd /opt/docker-cloudbot`  
  `cp opt/config.default.json opt/config.json`  
  `vi opt/config.json`  
1. Build docker image:  
  `make build`
1. Run container:  
  `make run`

### Version
1.0.0

### Lincense
[MIT](LICENSE)
