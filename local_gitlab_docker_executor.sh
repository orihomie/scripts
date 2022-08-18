#!/usr/bin/env bash

docker run -d \
    –name gitlab-runner \
    –restart never \
    -v $PWD:$PWD \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab/gitlab-runner:latest \

docker exec -it -w $PWD gitlab-runner gitlab-runner exec docker test

#  Источник: второй ответ на https://stackoverflow.com/questions/32933174/use-gitlab-ci-to-run-tests-locally

