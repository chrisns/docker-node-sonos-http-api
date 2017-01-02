FROM node:6-slim

WORKDIR /app

RUN wget -qO- https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app && \
  mkdir cache && \
  ln -s settings/settings.json && \
  chown -R node:node static cache && \
  npm install --production

EXPOSE 5005

USER node

CMD npm start