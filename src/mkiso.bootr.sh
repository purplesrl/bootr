#!/bin/sh
cd /build/aports/scripts
./mkimage.sh --tag $ALPINE_VERSION \
	--outdir /build/iso \
	--arch $ARCH \
	--repository http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/main/ \
	--profile bootr
