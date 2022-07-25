#!/usr/bin/enb sh

CONTAINER_NAME=$1
FOLDER_FOR_KEEPING_SECRET_FILES=$2

docker exec -t "${CONTAINER_NAME}" gitlab-backup create

docker cp "${CONTAINER_NAME}":/etc/gitlab/gitlab.rb "${FOLDER_FOR_KEEPING_SECRET_FILES}"
docker cp "${CONTAINER_NAME}":/etc/gitlab/gitlab-secrets.json "${FOLDER_FOR_KEEPING_SECRET_FILES}"

