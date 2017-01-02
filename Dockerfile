FROM node:6-alpine

WORKDIR /app

RUN apk update && \
  apk add ca-certificates && \
  update-ca-certificates && \
  apk add wget tar && \
  wget -qO- https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app && \
  mkdir cache && \
  ln -s settings/settings.json && \
  chown -R node:node static cache && \
  npm install --production

EXPOSE 5005

USER node

HEALTHCHECK --interval=1m --timeout=2s \
  CMD wget -qO- http://localhost:5005 || exit 1

CMD npm start