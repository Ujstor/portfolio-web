# Portfolio Website

This static website is built with Go and Templ.

Complete website in singe binary.

## Docker image Workflow
Variables are defined in config.yml and can be updated upon commit for new image tag:

```bash
docker:
  DOCKER_HUB_USERNAME: ujstor 
  DOCKER_REPO_NAME: portfolio-web-go
  VERSION_PART: Patch # Patch, Minor, major
  PUSH_TO_DOCKER: true
```
If the image does not exist, the default image tag is 0.0.1 for Patch, 0.1.0 for Minor, 1.0.0 for Major. Semantic versioning is employed upon commit, automatically incrementing the version.

Workflow also requires DockerHub login credentials, username and password configuration in the Action secret:

```bash
username: ${{ secrets.DOCKERHUB_USERNAME }}
password: ${{ secrets.DOCKERHUB_TOKEN }}
```

## Deployment
Deployment can be achieved through self-hosting service provided by [Collify](https://coolify.io/docs/installation). 

![](https://i.imgur.com/pi1WaHy.png)

## MakeFile

```bash
all: build

build:
	@echo "Building..."
	@templ generate
	@go build -o main cmd/api/main.go

docker-build:
	@docker build -t ujstor/portfolio-web-go .

run:
	@go run cmd/api/main.go

docker-run:
	@docker run -p 5000:5000 ujstor/portfolio-web-go

push:
	@docker push ujstor/portfolio-web-go

clean:
	@echo "Cleaning..."
	@rm -f main

.PHONY: all build docker-build run docker-run push clean 
```
