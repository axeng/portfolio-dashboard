#!/bin/sh

docker-compose -f dc_main.yml -f dc_keycloak.yml down
docker volume rm portfolio-dashboard_dist-volume || true
