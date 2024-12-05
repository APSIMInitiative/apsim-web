#!/usr/bin/env bash

# stop existing containers.
docker-compose down

# pull latest dockerhub image
docker pull apsiminitiative/postats

# bring up docker stack
docker-compose up -d

