# Files for both production and development
MAIN_FILES =
# Files for production
PROD_FILES = dc_main.yml dc_keycloak_prod.yml dc_api-database_prod.yml
# Files for development
DEV_FILES = dc_keycloak_dev.yml dc_api-database_dev.yml
# Volumes that need to be deleted when stopping docker
VOLUMES_TO_DELETE = portfolio-dashboard_dist-volume

# Start and stop arguments
START = up -d --build
STOP = down

MAIN_FILES_ARGS = $(MAIN_FILES:%=-f %)
PROD_FILES_ARGS = $(PROD_FILES:%=-f %)
DEV_FILES_ARGS = $(DEV_FILES:%=-f %)

all: prod start

prod:
	$(eval ADDITIONAL_FILES_ARGS=$(PROD_FILES_ARGS))

dev:
	$(eval ADDITIONAL_FILES_ARGS=$(DEV_FILES_ARGS))

start: files_args
	docker-compose $(FILES_ARGS) $(STOP)
	docker-compose $(FILES_ARGS) $(START)

stop: files_args
	docker-compose $(FILES_ARGS) $(STOP)
	docker volume rm $(VOLUMES_TO_DELETE) || true

files_args:
	$(eval FILES_ARGS=$(MAIN_FILES_ARGS) $(ADDITIONAL_FILES_ARGS))


.PHONY: prod dev start stop files_args
