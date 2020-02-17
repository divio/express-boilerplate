FROM node:12.16.0-alpine

RUN apk add tini

COPY package*.json /
RUN npm install --prefix /

ENV NODE_ENV=production
ENTRYPOINT ["/sbin/tini", "--"]

COPY . /app
WORKDIR /app

# noop files for non python projects and local development
RUN echo "#!/bin/sh" > /app/migrate.sh && chmod +x /app/migrate.sh
RUN echo "#!/bin/sh" > /usr/local/bin/start && chmod +x /usr/local/bin/start

EXPOSE 80

CMD ["npm", "start"]
