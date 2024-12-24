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

## MakeFile

```bash
all: build docker-build docker-run

build:
	@echo "Building..."
	@if command -v templ > /dev/null; then \
			templ generate; \
	else \
		read -p "Go's 'templ' is not installed on your machine. Do you want to install it? [Y/n] " choice; \
		if [ "$$choice" != "n" ] && [ "$$choice" != "N" ]; then \
			go install github.com/a-h/templ/cmd/templ@latest; \
			templ generate; \
		else \
			echo "You chose not to install templ. Exiting..."; \
			exit 1; \
		fi; \
	fi
	@go build -o main cmd/api/main.go

docker-build:
	@docker build -t ujstor/portfolio-web-go --target prod .

# Run the application
run:
	@go run cmd/api/main.go

docker-run:
	@docker run -p 5000:5000 ujstor/portfolio-web-go

# Push app to DockerHub
push:
	@docker push ujstor/portfolio-web-go

# Clean the binary
clean:
	@echo "Cleaning..."
	@rm -f main

watch:
	@if command -v air > /dev/null; then \
	    air; \
	    echo "Watching...";\
	else \
	    read -p "Go's 'air' is not installed on your machine. Do you want to install it? [Y/n] " choice; \
	    if [ "$$choice" != "n" ] && [ "$$choice" != "N" ]; then \
	        go install github.com/air-verse/air@latest; \
	        air; \
	        echo "Watching...";\
	    else \
	        echo "You chose not to install air. Exiting..."; \
	        exit 1; \
	    fi; \
	fi
.PHONY: all build docker-build run docker-run push clean watch
```
