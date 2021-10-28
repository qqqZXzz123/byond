# BYOND

[![Open in Visual Studio Code](https://open.vscode.dev/badges/open-in-vscode.svg)](https://open.vscode.dev/douglasparker/byond)
[![Docker Pulls](https://img.shields.io/docker/pulls/douglasparker/byond)](https://hub.docker.com/r/douglasparker/byond)
[![License](https://img.shields.io/github/license/douglasparker/byond)](https://github.com/douglasparker/byond/blob/release/LICENSE)

A docker image for building and hosting games made in the BYOND Engine.

## Tags

### Latest

The latest stable version of BYOND.

### Version

A specific version of BYOND.

## DreamDaemon (Host)

Example usage to host your projects.

### Docker Run

```docker
docker run --detach \
  --name mygame \
  --volume /opt/mygame:/opt/mygame \
  --publish 1337:1337 \
  --restart unless-stopped \
  douglasparker/byond:latest DreamDaemon /opt/mygame/mygame.dmb -ports 1337
```

### Docker Compose

#### docker-compose.yml

```docker
services:
  byond:
    image: douglasparker/byond:latest
    container_name: "mygame"
    command: "DreamDaemon /opt/mygame/mygame.dmb -ports 1337"
    volumes:
      - /opt/mygame:/opt/mygame
    ports:
      - 1337:1337
    restart: unless-stopped
```

## DreamMaker (Build)

Example usage to build your projects.

### Docker Run

```docker
docker run \
  --volume /opt/mygame:/opt/mygame \
  douglasparker/byond:latest DreamMaker /opt/mygame/mygame.dme
```
