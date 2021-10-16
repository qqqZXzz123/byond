# BYOND

A docker image for building and hosting games made in the BYOND Engine.

## Tags

### Latest

The latest stable version of BYOND.

### Version

A specific version of BYOND.

## DreamDaemon (Host)

Example usage to host your projects.

### Docker Run

```sh
docker run --detach \
  --name mygame \
  --volume /opt/mygame:/opt/mygame \
  --publish 1337:1337 \
  --restart unless-stopped \
  douglasparker/byond:latest DreamDaemon /opt/mygame/mygame.dmb -ports 1337
```

### Docker Compose

Examples coming soon!

## DreamMaker (Build)

Example usage to build your projects.

### Docker Run

```sh
docker run \
  --volume /opt/mygame:/opt/mygame \
  douglasparker/byond:latest DreamMaker /opt/mygame/mygame.dme
```

### Docker Compose

Examples coming soon!
