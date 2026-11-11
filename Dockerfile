FROM node:26.13.1-alpine@sha256:f56092a5d85c32beef14de944aaa0110193ef1ae85205036c5d40d8aece58759

WORKDIR /app

COPY node-sonos /app

RUN apk add --no-cache curl && \
  mkdir cache && \
  chown -R node:node static cache && \
  npm install --production && \
  rm -rf /tmp/* /root/.npm

EXPOSE 5005

ENV NODE_OPTIONS=--openssl-legacy-provider

USER node

HEALTHCHECK --interval=1m --timeout=2s \
  CMD curl -LSfs http://localhost:5005/zones || exit 1

CMD npm start
