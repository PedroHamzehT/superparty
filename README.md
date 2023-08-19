# Running application

This application is using docker, so you start it by either, setting up the project manually through bundle or just using docker.

If you don't how docker works, the project has a makefile to help you with some common commands:

- `make start` -> This will start the project and its dependencies (PostgreSQL and Mailcatcher)
- `make stop` -> This will stop the project and its dependencies (PostgreSQL and Mailcatcher)
- `make console` -> This will open a rails console for you
- `make migrate` -> This will run the rails rake task to execute the pending migrations
- `make logs` -> This will show up the logs of all services running (Rails, PostgreSQL and Mailcatcher)
