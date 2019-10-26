FROM alpine:3.10

MAINTAINER George Tabacar <g.tabacar@purplesrl.com>

ENV ALPINE_VERSION 3.10
ENV ARCH x86_64
ENV PACKAGER "Bootr <bootr@bootr.org>"

RUN apk add --update \
    alpine-sdk \
    build-base \
    apk-tools \
    alpine-conf \
    busybox \
    fakeroot \
    syslinux \
    squashfs-tools \
    xorriso \
    mtools \
    dosfstools \
    grub-efi \
    openssh \
    nano

RUN adduser build -S -G abuild -h /build -s /bin/sh

USER build
WORKDIR /build

RUN abuild-keygen -i -a \
    && git clone git://git.alpinelinux.org/aports

ENV ALPINE_REPO http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/main/

RUN mkdir -p /build/configs/network /build/configs/openvpn /build/configs/startup

COPY --chown=build:abuild mkimg.bootr.sh /build/aports/scripts/mkimg.bootr.sh
COPY --chown=build:abuild genapkovl-bootr.sh /build/aports/scripts/genapkovl-bootr.sh
COPY --chown=build:abuild mkiso.bootr.sh /build/aports/scripts/mkiso.bootr.sh
COPY --chown=build:abuild bootstrap.start /build/aports/scripts/bootstrap.start
COPY --chown=build:abuild configs/network/ /build/configs/network/
COPY --chown=build:abuild configs/openvpn/ /build/configs/openvpn/
COPY --chown=build:abuild configs/startup/ /build/configs/startup/

RUN chmod +x /build/aports/scripts/* \
    && mkdir -p /build/iso

CMD ["/build/aports/scripts/mkiso.bootr.sh"]

