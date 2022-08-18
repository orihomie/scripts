#!/usr/bin/env bash

token=$1
url=$2
name=$3
docker_image_version="docker:20.10.5"
tags=$4

docker run --rm -it -v /data/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register -n --url "${url}" --registration-token "${token}" --executor docker --description "${name}" --docker-image "${docker_image_version}" --docker-volumes /var/run/docker.sock:/var/run/docker.sock --tag-list "${tags}"

