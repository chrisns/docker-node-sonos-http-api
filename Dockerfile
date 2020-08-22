FROM node:14-alpine

WORKDIR /app

COPY node-sonos /app

RUN mkdir cache && \
  ln -s settings/settings.json && \
  chown -R node:node static cache && \
  npm install --production && \
  rm -rf /tmp/* /root/.npm

EXPOSE 5005

USER node

HEALTHCHECK --interval=1m --timeout=2s \
  CMD curl -LSs http://localhost:5005 || exit 1

CMD npm start