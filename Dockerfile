FROM node:22.12.0-alpine@sha256:348b3e6ff4eb6b9ac7c9cc5324b90bf8fc2b7b97621ca1e9e985b7c80f7ce6b3

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
