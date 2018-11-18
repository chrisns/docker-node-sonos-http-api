# Native build version for arm32v7 build platforms

FROM arm32v7/node:6

WORKDIR /app

RUN curl -L https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app && \
    mkdir cache && \
    ln -s settings/settings.json && \
    chown -R node:node static cache && \
    npm install --production && \
    rm -rf /tmp/* /root/.npm

EXPOSE 5005

USER node

HEALTHCHECK --interval=1m --timeout=2s \
  CMD curl -LSs http://localhost:5005 || exit 1

CMD npm start
