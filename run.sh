#!/bin/sh

docker-compose -f dc_main.yml -f dc_keycloak_prod.yml down
docker-compose -f dc_main.yml -f dc_keycloak_prod.yml up -d --build
