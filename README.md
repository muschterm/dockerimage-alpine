dockerimage-alpine
===

This image extends the `alpine` official image in order to support easier local development using Docker.

Build Instructions
---

There is a `docker-build` script in `muschterm/dotfiles.git` that assists with building, tagging, and pushing this image to `hub.docker.com`.

### 3.19.0 - latest

glibc versions: https://github.com/sgerrand/alpine-pkg-glibc/releases/
Miniconda versions: https://repo.anaconda.com/miniconda/

```
alpine_version=3.19.0; \
glibc_version=2.35-r1; \
miniconda_version=latest; \
\
docker-build --tag-latest "muschterm/alpine:${alpine_version}" && \
\
docker-build -f Dockerfile.glibc --tag-latest "muschterm/alpine-glibc:${alpine_version}-${glibc_version}" && \
\
miniconda_tag_latest=; \
if [ "$miniconda_version" = "latest" ]; then miniconda_tag_latest="--tag-latest"; fi; \
docker-build -f Dockerfile.miniconda "$miniconda_tag_latest" "muschterm/alpine-miniconda:${alpine_version}-${miniconda_version}";
```

### 3.18.5

```
alpine_version=3.18.5; \
glibc_version=2.35-r1; \
miniconda_version=4.5.12; \
docker-build "muschterm/alpine:${alpine_version}" && \
docker-build -f Dockerfile.glibc "muschterm/alpine-glibc:${alpine_version}-${glibc_version}" && \
docker-build -f Dockerfile.miniconda "muschterm/alpine-miniconda:${alpine_version}-${miniconda_version}";
```
