FROM node:18.14.1-alpine@sha256:045b1a1c90bdfd8fcaad0769922aa16c401e31867d8bf5833365b0874884bbae

WORKDIR /app

COPY node-sonos /app

RUN apk add --no-cache curl && \
  mkdir cache && \
  chown -R node:node static cache && \
  npm install --production && \
  rm -rf /tmp/* /root/.npm

EXPOSE 5005

USER node

HEALTHCHECK --interval=1m --timeout=2s \
  CMD curl -LSfs http://localhost:5005/zones || exit 1

CMD npm start
