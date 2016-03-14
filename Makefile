DOCKER_USER?=$(shell whoami)
DOCKER_REGISTRY?=docker.io

IMAGE_NAME=${DOCKER_USER}/helloworld-server

all: build-linux build-docker

build:
	go build -o helloworld-server

build-linux:
	GOOS=linux GOARCH=amd64 go build -o helloworld-server

build-docker:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d -p 8080:8080 $(IMAGE_NAME)

clean:
	rm -f helloworld-server

push:
	docker push $(IMAGE_NAME)
