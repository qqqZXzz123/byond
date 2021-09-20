# BYOND

A BYOND image for compiling and hosting games made in the BYOND Engine.

## Tags

### Latest

The latest stable version of BYOND.

### Version

A specific version of BYOND.

## DreamDaemon (Hosting)

Example usage to host your projects.

### Docker Run

```sh
docker run --volume /opt/mygame:/opt/mygame --publish 1337:1337 douglasparker/byond:latest DreamMaker /opt/mygame/mygame.dmb
```

### Docker Compose

Examples coming soon!

## DreamMaker (Compile)

Example usage to build and compile your projects.

### Docker Run

```sh
docker run --volume /opt/mygame:/opt/mygame douglasparker/byond:latest DreamMaker /opt/mygame/mygame.dme
```

### Docker Compose

Examples coming soon!