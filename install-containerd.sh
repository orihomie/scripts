#!/usr/bin/env bash

REPO="containerd/containerd"

OS=linux
ARCH=amd64
NAME="containerd"

if [ "$(uname -m)" = "aarch64" ]; then ARCH=arm64; fi

FILE_NAME=$(./download-tool-from-github.sh -o $OS -a $ARCH -r $REPO -n $NAME)

echo $FILE_NAME

set -e
sudo tar xzvf $FILE_NAME -C /usr/local/

rm $FILE_NAME

