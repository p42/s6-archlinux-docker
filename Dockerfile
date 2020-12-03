FROM archlinux/base:latest
MAINTAINER Jordan Clark mail@jordanclark.us

ENV S6_OVERLAY_VERSION 2.1.0.2
ENV S6_OVERLAY_MD5HASH 7e81e28fcb4d882d2fbc6c7f671758e2

COPY container-files /

RUN pacman --noconfirm -Syu && \
pacman --noconfirm -S wget tar && \
rm -rf /usr/share/man/* /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /etc/pacman.d/mirrorlist.pacnew && \
cd /tmp && \
wget https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz && \
echo "$S6_OVERLAY_MD5HASH *s6-overlay-amd64.tar.gz" | md5sum -c - && \
tar xzf s6-overlay-amd64.tar.gz -C / && \
rm s6-overlay-amd64.tar.gz && \
sh /usr/local/sbin/fix-bins.sh

ENTRYPOINT ["/init"]
