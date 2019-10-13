#!/bin/bash
docker build -t bootr:latest src
docker run --cpus="4" --rm --name bootr -v $(pwd)/iso:/build/iso -ti bootr:latest 
