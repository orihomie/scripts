#!/usr/bin/env bash

./install-containerd.sh

URL=https://raw.githubusercontent.com/containerd/containerd/main/containerd.service
DOWNLOAD_PATH=/usr/local/lib/systemd/system
FILE_NAME=containerd.service

sudo mkdir -p /usr/local/lib/systemd/system
curl -L -o "${DOWNLOAD_PATH}/${FILE_NAME}" $URL

systemctl daemon-reload
systemctl enable --now containerd

