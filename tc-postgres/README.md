# docker-tc-postgres

A postgres docker image for TeamCity.

## Build

Example:
```
docker build -t tc-postgres .
```

## Run

Example:
```
docker run -d --name=tc-postgres --link teamcity:teamcity --privileged -e TEAMCITY_SERVER=http://teamcity:8111 tc-postgres
```