# docker-node-sonos-http-api
Docker wrapper for https://github.com/jishi/node-sonos-http-api

[![GitHub issues](https://img.shields.io/github/issues/chrisns/docker-node-sonos-http-api.svg)](https://github.com/chrisns/docker-node-sonos-http-api/issues)
[![GitHub forks](https://img.shields.io/github/forks/chrisns/docker-node-sonos-http-api.svg)](https://github.com/chrisns/docker-node-sonos-http-api/network)
[![GitHub stars](https://img.shields.io/github/stars/chrisns/docker-node-sonos-http-api.svg)](https://github.com/chrisns/docker-node-sonos-http-api/stargazers)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chrisns/docker-node-sonos-http-api/master/LICENSE)
[![Docker Stars](https://img.shields.io/docker/stars/chrisns/docker-node-sonos-http-api.svg)](https://hub.docker.com/r/chrisns/docker-node-sonos-http-api)
[![Docker Pulls](https://img.shields.io/docker/pulls/chrisns/docker-node-sonos-http-api.svg)](https://hub.docker.com/r/chrisns/docker-node-sonos-http-api)
[![Docker Automated build](https://img.shields.io/docker/automated/chrisns/docker-node-sonos-http-api.svg)](https://hub.docker.com/r/chrisns/docker-node-sonos-http-api)
![Docker Image CI](https://github.com/chrisns/docker-node-sonos-http-api/workflows/Docker%20Image%20CI/badge.svg?branch=master)

## Usage
Refer to https://github.com/jishi/node-sonos-http-api for all the configuration detail

First create the local directories and the settings file:
```shell
mkdir clips
mkdir cache
mkdir presets
curl https://raw.githubusercontent.com/jishi/node-sonos-http-api/master/presets/example.json > presets/example.json
echo {} > settings.json
```

Then run the docker image:
```shell
docker run \
  --net=host \
  --name sonos \
  --restart=always \
  -d \
  -v `pwd`/settings.json:/app/settings.json \
  -v `pwd`/clips:/app/static/clips \
  -v `pwd`/cache:/app/cache \
  -v `pwd`/presets:/app/presets \
  chrisns/docker-node-sonos-http-api
```

If you want to run in a swarm see an example setup here: https://github.com/pinked/clustered_sonos. The important thing is using the *host* networking interface so that it can discover your Sonos devices.

If you're looking this as part of a bigger home automation piece you might also want to look at [my MQTT hack job](https://github.com/chrisns/sonos-mqtt).
