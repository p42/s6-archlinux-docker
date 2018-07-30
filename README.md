# project42/s6-archlinux

[![pipeline status](https://git.jordanclark.us/devops/s6-archlinux-docker/badges/master/pipeline.svg)](https://git.jordanclark.us/devops/s6-archlinux-docker/commits/master)

## Introduction
A docker image based on Arch Linux with the s6 process supervisor

### What is Arch Linux?
Arch Linux is a simple lightweight Linux Distribution with a strong community.  It is simple, modern, pragmatic, user centric and versatile.  Arch Linux uses a rolling release model. The distro expects the user to be willing to make some effort to understand the systems operation and is popular among more advanced linux users.

### What is the s6-overlay?
The [s6-overlay project](https://github.com/just-containers/s6-overlay) is a series of init scripts and utilities to ease creating Docker images using s6 as a process supervisor.  The s6-overlay makes it easy to take advantages of s6 while still operate like other Docker images.  The s6 init system provides many helpful tools to initialize and manage processes as the Docker container starts.

### Tags

| Tag | Description |
|---|---|
| latest | The most current build.  Images based on latest may change often an possibly could break.  Test your images |
| 1.21.4.0 | S6 Overlay v1.21.4.0 built on 2018-07-12 |
| 1.20.0.0 | S6 Overlay v1.20.0.0 built on 2017-09-26 |

### Issues

I'm sure there are some but currently I'm unaware of current issues.  If you find an issue please let me know on [GitHub](https://github.com/p42/s6-archlinux-docker/issues)

### Prerequisites

A working docker daemon would be helpful to utilize this image.

## How to use this image

This image is meant to be used as a base to build custom docker images from.  It's value is that it takes the base arch linux image and adds the s6 Overlay.

### Usage

###### Running a quick arch linux container

~~~
docker run --rm -ti project42/s6-archlinux:latest bash
~~~ 

This will present you with a shell on fresh container that will stop and remove itself when you exit the container.

###### Dockerfile that is based of of this image.

~~~
FROM project42/s6-archlinux:latest

RUN pacman --noconfirm -Syu && \
pacman --noconfirm -S cowsay && \
rm -rf /usr/share/man/* \
/var/cache/pacman/pkg/* \
/var/lib/pacman/sync/* \
/etc/pacman.d/mirrorlist.pacnew

ENTRYPOINT ["/init"]
~~~

## Configuration

### Configuration Parameters
| Environment | Description |
| --- | --- |
| TZ | Sets the container Timezone; example: CST6CDT default: UTC |  

## Maintenance

### Upgrading

### Shell Access

This image includes the bash shell and when running in detached mode can be connected to with:

~~~
docker exec -ti <container> bash
~~~


## References

Maintainer: [https://jordanclark.us](https://jordanclark.us)

Maintainer's git repo: [https://git.jordanclark.us/devops/s6-archlinux-docker](https://git.jordanclark.us/devops/s6-archlinux-docker)

Github Issues: [https://github.com/p42/s6-archlinux-docker/issues](https://github.com/p42/s6-archlinux-docker/issues)

Arch Linux: [https://www.archlinux.org](https://www.archlinux.org)

s6-overlay: [https://github.com/just-containers/s6-overlay](https://github.com/just-containers/s6-overlay)

s6 supervisor: [http://www.skarnet.org/software/s6/index.html](http://www.skarnet.org/software/s6/index.html)
