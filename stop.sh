#!/bin/sh

docker-compose -f dc_main.yml -f dc_keycloak_prod.yml down
docker volume rm portfolio-dashboard_dist-volume || true
