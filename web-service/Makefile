DOCKER_USERNAME ?= dev.local
APPLICATION_NAME ?= fibonacci
# APPLICATION_NAME ?= $(shell basename ${PWD})
DOCKER_TAG ?= ${DOCKER_USERNAME}/${APPLICATION_NAME}:1.0.0

build-load:
	make build
	make load

build-run:
	make build
	make run

build:
	docker build --tag ${DOCKER_TAG} .

load:
	minikube image load --overwrite ${DOCKER_TAG}

run:
	docker run -p 3000:3000 --rm -it ${DOCKER_TAG}

compose:
	docker-compose up --build
