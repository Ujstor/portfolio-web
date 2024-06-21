# Build the application
all: build

build:
	@echo "Building..."
	@templ generate
	@go build -o main cmd/api/main.go

docker-build:
	@docker build -t ujstor/portfolio-web-go .

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

.PHONY: all build docker-build run docker-run push clean 
