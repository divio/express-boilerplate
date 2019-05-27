===================
Express Boilerplate
===================

`Divio Cloud <http://www.divio.com/>`_ based boilerplate to develop with Express JS.

Up to date with `Express <https://expressjs.com/>`_ **4.17.1**.

The project files have been generated using `express-generator <https://expressjs.com/en/starter/generator.html>`_.
An example database connection has been added to ``myapp/app.js`` from the Express
`guides <https://expressjs.com/en/guide/database-integration.html#postgresql>`_.


=================
Local Development
=================

This boilerplate installs ``node_modules`` into the root of the Docker container.
To work seamless locally, you need to run *docker-compose* using the correct prefix::

    docker-compose run --rm web npm install jquery --save --prefix /

And to save it to your projects directory::

    docker-compose run --rm web npm install jquery --save

Otherwise you might run into unexpected issues as the ``node_modules`` folder is in the root 
of the container and your project directory. Alternatively delete the ``node_modules`` folder
from the root of the container while working locally.

We are using `nodemon <https://github.com/remy/nodemon>`_ locally to monitor changes and 
restart the server automatically.


========
Database
========

The boilerplate uses ``pg-promise`` to talk to the database. A good example of the usage can be found `here <https://github.com/vitaly-t/pg-promise-demo>`_.
