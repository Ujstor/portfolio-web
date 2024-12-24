# Portfolio Website

This static website is built using HTML, CSS, and JavaScript and served using a Go or Flask web server. It's designed to showcase your personal or professional projects, skills, and any other information you'd like to share with the world.

The website is containerized using Docker Compose for easy deployment and scaling.

## Docker Compose

Build image and start the Docker containers using Docker Compose:

```bash
docker compose up web-prod --build -d
```

This command will build the Docker image for your website and start the container.

You can now access your portfolio website by navigating to `http://localhost:5000` in your web browser.



## Jenkins Pipeline
The pipeline is designed to automate the processes of testing, building, and deploying a web application using Docker.
It creates an image and pushes it to DockerHub. This simplifies deployment with Docker Compose. Additionally,
the pipeline is configured to perform these tasks when certain conditions are met, such as specific branch.

![](https://i.imgur.com/llEoE4e.png)


## Deployment
Application deployment can be achieved through the utilization of either a `Go` or `Flask` server, orchestrated using docker-compose,
and hosted on the cloud self-hosting service provided by [Collify](https://coolify.io/docs/installation). Please note that the Flask server resides on a distinct branch.

## MakeFile

run all make commands with clean tests
```bash
make all build
```

build the application
```bash
make build
```

build docker image
```bash
make docker-build
```

run the application
```bash
make run
```

run docker image
```bash
make docker-run
```

push image to DockerHub
```bash
make push
```

live reload the application
```bash
make watch
```

run the test suite
```bash
make test
```

clean up binary from the last build
```bash
make clean
```
