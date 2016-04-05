# docker-build-server

A docker setup of a build server with Postgres, TeamCity and a TeamCity Agent.

The TeamCity agent is setup with some requirements for integration testing [urchin] (https://github.com/anhem/urchin) such as ecryptfs and mhddfs

Data from all docker containers are persisted with docker data volume in `/data` on host machine

## Requirements

Docker-compose

## Build

```
docker-compose build
```

## Run

```
docker-compose up -d
```

## Setup

run `docker inspect teamcity` to get teamcity_ip.
Goto http://teamcity_ip:8111/ and follow the instructions.
Configure teamcity with postgres and enter `postgres:5432` as ip and `teamcity` as username and password

The TeamCity Agent will most likely timeout during setup with the following:
```
Teamcity server did not respond within 120 seconds...
exited with code 42
```
Simply stop the remaining containers with `docker-compose stop` and run `docker-compose up -d` again once setup is complete

Goto http://teamcity_ip:8111/agents.html?tab=unauthorizedAgents and authorize agent


