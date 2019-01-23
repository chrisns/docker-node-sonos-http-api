# Dockerfile that will build an arm32v7 image on an x86 build host

FROM balenalib/raspberrypi3-debian-node:6
# Balena base image required for cross-build capabilities

WORKDIR /app

### Run commands within QEMU ARM cross-build emulation
RUN [ "cross-build-start" ]

RUN install_packages curl

RUN adduser --disabled-password --gecos "" node

RUN curl -L https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app && \
    mkdir cache && \
    ln -s settings/settings.json && \
    chown -R node:node static cache && \
    npm install --production && \
    rm -rf /tmp/* /root/.npm

RUN [ "cross-build-end" ]
### End QEMU ARM emulation

EXPOSE 5005

USER node

HEALTHCHECK --interval=1m --timeout=2s \
  CMD curl -LSs http://localhost:5005 || exit 1

CMD npm start
