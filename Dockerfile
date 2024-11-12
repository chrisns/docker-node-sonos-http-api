FROM node:18.20.4-alpine@sha256:f178e794fca41e13805253a47fc3430fcca54ae0aefcb9d0403c23a7ed400b30

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
