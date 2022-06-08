FROM node:18.3.0-alpine@sha256:54f0280725f18e204fb7380f9a1f21213da5c044acc5dddf6a2c02c424958012

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
