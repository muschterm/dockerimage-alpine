dockerimage-alpine
===

This image extends the `alpine` official image in order to support easier local development using Docker.

Build Instructions
---

There is a `docker-build` script in `muschterm/dotfiles.git` that assists with building, tagging, and pushing this image to `hub.docker.com`.

### 3.14.1 - latest

```
docker-build --tag-latest muschterm/alpine:3.14.1
```

### 3.13.5

```
docker-build muschterm/alpine:3.13.5
```
