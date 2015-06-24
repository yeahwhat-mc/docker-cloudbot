# Base image
FROM orchardup/python:3.4
MAINTAINER Jonas Friedmann <j@frd.mn>

# Update and install requirements
RUN apt-get update
RUN apt-get install -y python3-pip git libenchant1c2a libxml2-dev libxslt-dev zlib1g-dev

# Clone CloudBot from GitHub
RUN git clone https://github.com/yeahwhat-mc/CloudBot.git /opt/cloudbot

# Install Python dependencies
RUN pip3 install -r /opt/cloudbot/requirements.txt

# Add configuration and set working directory
ADD opt/config.json /opt/cloudbot/
WORKDIR /opt/cloudbot

# Expose volume
VOLUME ["/opt/cloudbot/data"]

# Start actual haste-server
CMD python3 -m cloudbot
