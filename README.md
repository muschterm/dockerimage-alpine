dockerimage-alpine
===

This image extends the `alpine` official image in order to support easier local development using Docker.

Build Instructions
---

There is a `docker-build` script in `muschterm/dotfiles.git` that assists with building, tagging, and pushing this image to `hub.docker.com`.

### 3.19.0 - latest

```
docker-build --tag-latest muschterm/alpine:3.19.0
```

### 3.18.5

```
docker-build muschterm/alpine:3.13.5
```
