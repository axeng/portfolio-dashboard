# docker-compose files
DC_MAIN_FILES = dc_main.yml
DC_KEYCLOAK_PROD_FILES = dc_keycloak_prod.yml
DC_KEYCLOAK_DEV_FILES =  dc_keycloak_dev.yml
DC_API-DATABASE_PROD_FILES = dc_api_database_prod.yml
DC_API-DATABASE_DEV_FILES = dc_api_database_dev.yml
DC_RABBITMQ_PROD_FILES = dc_rabbitmq_prod.yml
DC_RABBITMQ_DEV_FILES = dc_rabbitmq_dev.yml


# Files for production
PROD_FILES = $(DC_MAIN_FILES) \
			 $(DC_KEYCLOAK_PROD_FILES) \
			 $(DC_API-DATABASE_PROD_FILES) \
			 $(DC_RABBITMQ_PROD_FILES)
# Files for development
DEV_FILES = $(DC_KEYCLOAK_DEV_FILES) \
			$(DC_API-DATABASE_DEV_FILES) \
			$(DC_RABBITMQ_DEV_FILES)
# Volumes that need to be deleted when stopping docker
VOLUMES_TO_DELETE = portfolio-dashboard_dist-volume

# Start and stop arguments
START = up -d --build
STOP = down


define append_files
	$(eval FILES=$(FILES) $(1))
endef


all: prod start

prod:
	$(eval FILES=$(PROD_FILES))

dev:
	$(eval FILES=$(DEV_FILES))

keycloak_prod:
	$(call append_files,$(DC_KEYCLOAK_PROD_FILES))

keycloak_dev:
	$(call append_files,$(DC_KEYCLOAK_DEV_FILES))

api-database_prod:
	$(call append_files,$(DC_API-DATABASES_PROD_FILES))

api-database_dev:
	$(call append_files,$(DC_API-DATABASES_DEV_FILES))

rabbitmq_prod:
	$(call append_files,$(DC_RABBITMQ_PROD_FILES))

rabbitmq_dev:
	$(call append_files,$(DC_RABBITMQ_DEV_FILES))

start: create_args
	docker-compose $(FILES_ARGS) $(STOP)
	docker-compose $(FILES_ARGS) $(START)

stop: create_args
	docker-compose $(FILES_ARGS) $(STOP)
	docker volume rm $(VOLUMES_TO_DELETE) || true

create_args:
	$(eval FILES_ARGS=$(FILES:%=-f %))


.PHONY: all \
		start \
		stop \
		create_args \
		prod \
		dev \
		keycloak_prod \
		keycloak_dev \
		api-database_prod \
		api-database_dev \
		rabbitmq_prod \
		rabbitmq_dev
