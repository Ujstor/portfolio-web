# Portfolio Website

This static website is built with Go and Templ.

## Deployment
Deployment can be achieved through self-hosting service provided by [Collify](https://coolify.io/docs/installation). 

<br>
<br>

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
