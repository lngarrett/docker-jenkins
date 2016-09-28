#!/bin/bash
docker rm -f jenkins
docker build -t jenkins .
sudo mkdir -p /opt/warehouse/jenkins
docker run \
  --name="jenkins" \
  --publish=4321:8080 \
  --publish=50000:50000 \
  --volume=/var/warehouse/jenkins:/var/jenkins_home \
  --restart="always" \
  --detach=true \
  jenkins
