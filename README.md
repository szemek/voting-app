# Voting App

## Docker architecture overview

![Overview](docs/overview.png)

## Installation

Tested on Docker 1.9.1

1. Install [Docker](https://www.docker.com/)
2. Clone repository `git clone https://github.com/szemek/voting-app.git`
3. `docker-compose up`
4. Open IP address where your docker machine is running. Port 80.

### Scaling up

```
docker-compose scale app=N
docker-compose up --force-recreate
```
