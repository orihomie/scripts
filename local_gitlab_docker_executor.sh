#!/usr/bin/env bash

gitlab_pipeline_job_name=test
image_name=gitlab/gitlab-runner:latest
running_image=$(docker ps --format "{{.Image}}")

if [[ "${running_image}" != "${image_name}" ]]; then

    docker run -d \
        --name gitlab-runner \
        --restart no \
        -v $PWD:$PWD \
        -v /var/run/docker.sock:/var/run/docker.sock \
        $image_name

fi

docker exec -it -w $PWD gitlab-runner gitlab-runner exec docker $gitlab_pipeline_job_name

#  Источник: второй ответ на https://stackoverflow.com/questions/32933174/use-gitlab-ci-to-run-tests-locally

