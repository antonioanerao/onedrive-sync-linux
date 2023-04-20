#!/bin/bash
source .env
docker container stop ${ONEDRIVE_CONTAINER_NAME}
