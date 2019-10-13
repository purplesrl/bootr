#!/bin/sh
cd /build/aports/scripts
./mkimage.sh --tag $ALPINE_VERSION \
	--outdir /build/iso \
	--arch $ARCH \
	--repository $ALPINE_REPO \
	--profile bootr
