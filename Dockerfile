FROM node:18.20.6-alpine@sha256:d1743c8080c444dd443179e9e19df376bde97316d5584f5cc1ca0225f88768a5

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
