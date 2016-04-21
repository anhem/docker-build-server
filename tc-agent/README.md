# docker-tc-agent

A TeamCity Agent docker image to support requirements in [urchin] (https://github.com/anhem/urchin)

## Requirements

a TeamCity server. The agent runtime is downloaded from the TeamCity server when started.

## Build

Example:
```
docker build -t urchin-tc-agent .
```

## Run

Example:
```
docker run -d --name=teamcity-agent-1 --link teamcity:teamcity --privileged -e TEAMCITY_SERVER=http://teamcity:8111 urchin-tc-agent
```