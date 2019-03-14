FROM node:10.15.3-alpine

RUN apk add tini

COPY . /app
WORKDIR /app

RUN npm install --prefix myapp

# noop files for non python projects and local development
RUN echo "#!/bin/bash" > /app/migrate.sh && chmod +x /app/migrate.sh
RUN echo "#!/bin/bash" > /usr/local/bin/start && chmod +x /usr/local/bin/start

ENV NODE_ENV=production
ENTRYPOINT ["/sbin/tini", "--"]

EXPOSE 80

USER node

CMD ["npm", "start", "--prefix", "myapp"]
