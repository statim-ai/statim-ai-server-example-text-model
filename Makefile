#!/bin/bash

VERSION := `grep -m 1 version statim-ai.toml | tr -s ' ' | tr -d '"' | tr -d "'" | cut -d' ' -f3`
NAME := `grep -m 1 name statim-ai.toml | tr -s ' ' | tr -d '"' | tr -d "'" | cut -d' ' -f3`
IMAGE := ${NAME}:${VERSION}

build:
	docker build -t ${IMAGE} .

run:
	docker run --env-file .env --rm -p 5000:5000 ${IMAGE}
