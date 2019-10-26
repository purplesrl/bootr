#!/bin/bash
mkdir -p iso
chmod 0757 iso
rm -rf src/configs
cp -rap configs src/configs

docker build -t bootr:latest src
docker run --cpus="4" --rm --name bootr -v $(pwd)/iso:/build/iso -ti bootr:latest
