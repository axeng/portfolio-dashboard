#!/bin/sh

docker-compose -f dc_main.yml -f dc_keycloak.yml down
docker-compose -f dc_main.yml -f dc_keycloak.yml up -d --build
