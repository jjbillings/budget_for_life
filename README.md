# README
## Budget For Life

### Setup
1. Run `docker-compose build` to build the docker image with dependencies
2. Run `docker-compose up` to start the web server
3. For the first time setup, run `docker-compose exec db rails db:setup db:migrate` to setup the postgres database
