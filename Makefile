AUTHOR = frdmn
NAME = docker-cloudbot
VERSION = 1.0.0
SHELL := /bin/bash

.PHONY: all build

all: build run

build:
	docker build -t "$(AUTHOR)/$(NAME):$(VERSION)" .

stop:
	@if [[ "$(shell docker inspect -f {{.State.Running}} "$(NAME)" 2> /dev/null)" == "true" ]]; then \
		printf "INFO: Stopping running container '$(NAME)' ..."; \
		docker stop "$(NAME)" &> /dev/null && printf " done!\n" || printf " failed!\n"; \
	else \
		printf "WARN: container '$(NAME)' is not running.\n"; \
	fi

remove:
	@if [[ "$(shell docker inspect -f {{.State.Running}} "$(NAME)" 2> /dev/null)" == "false" ]]; then \
		printf "INFO: Removing existing container '$(NAME)' ..."; \
		docker rm "$(NAME)" &> /dev/null && printf " done!\n" || printf " failed!\n"; \
	else \
		printf "WARN: container '$(NAME)' doesn't exist.\n"; \
	fi

run: stop remove
	@printf "INFO: Starting new container '$(NAME)' ..."
	@docker run --restart=always -d --name="$(NAME)" -v $(shell pwd)/storage/logs:/opt/cloudbot/logs $(AUTHOR)/$(NAME):$(VERSION) &> /dev/null && printf " done!\n" || printf " failed!\n"
