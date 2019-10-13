FROM alpine:3.10

MAINTAINER George Tabacar <g.tabacar@purplesrl.com>

ENV ALPINE_VERSION 3.10
ENV ARCH x86_64

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
    nano

RUN adduser build -S -G abuild -h /build -s /bin/sh

USER build
WORKDIR /build

RUN abuild-keygen -i -a \
    && git clone git://git.alpinelinux.org/aports

COPY --chown=build:abuild mkimg.bootr.sh /build/aports/scripts/mkimg.bootr.sh
COPY --chown=build:abuild genapkovl-bootr.sh /build/aports/scripts/genapkovl-bootr.sh

RUN chmod +x /build/aports/scripts/* \
    && mkdir -p /build/iso \
    && /build/aports/scripts/mkimage.sh --tag bootr \
	--outdir /build/iso \
	--arch $ARCH \
	--repository http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/main/ \
	--profile bootr
