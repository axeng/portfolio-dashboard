#!/bin/sh
docker-compose down
docker volume rm portfolio-dashboard_dist-volume || true
