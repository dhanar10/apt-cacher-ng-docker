#!/usr/bin/env bash

set -e
set -o pipefail

docker build -t ubuntu-apt-cacher-ng .
docker run -d --restart unless-stopped \
	--network host \
	"$@" \
	ubuntu-apt-cacher-ng
	