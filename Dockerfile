FROM node:16.15.0

RUN apt-get update && apt-get install -y tini

COPY package*.json /
RUN npm install --prefix /

ENV NODE_ENV=production
ENTRYPOINT ["tini", "--"]

COPY . /app
WORKDIR /app

# noop files for non python projects and local development
RUN echo "#!/bin/sh" > /app/migrate.sh && chmod +x /app/migrate.sh
RUN echo "#!/bin/sh" > /usr/local/bin/start && chmod +x /usr/local/bin/start

EXPOSE 80

CMD ["npm", "start"]
