#!/bin/bash
docker build -t bootr:latest src
docker run --rm --name bootr -ti bootr:latest /bin/sh
