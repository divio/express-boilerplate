FROM node:10.15.1

COPY . /app
WORKDIR /app

RUN npm install --prefix myapp

# noop files for non python projects and local development
RUN echo "#!/bin/bash" > /app/migrate.sh && chmod +x /app/migrate.sh
RUN echo "#!/bin/bash" > /usr/local/bin/start && chmod +x /usr/local/bin/start

EXPOSE 80
CMD npm start --prefix myapp
