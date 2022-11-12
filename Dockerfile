FROM node:18.12.1-alpine@sha256:f2e8ae5ef2c8d2da0ec051bb708bd9e9e70d3812e620b4c577d8b84155f7f57f

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
