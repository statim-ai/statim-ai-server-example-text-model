#!/bin/bash

IMAGE := statim-ai-server-example-text-model

build:
	docker build -t ${IMAGE} .

run:
	docker run --env-file .env --rm -p 5000:5000 ${IMAGE}
