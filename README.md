# Portfolio Website

This static website is built using HTML, CSS, and JavaScript and served using a Go or Flask web server. It's designed to showcase your personal or professional projects, skills, and any other information you'd like to share with the world.

The website is containerized using Docker Compose for easy deployment and scaling.

## Docker Compose

Build and start the Docker containers using Docker Compose:

```bash
docker compose up
```

This command will build the Docker image for your website and start the container.

You can now access your portfolio website by navigating to `http://localhost:8080` in your web browser.

## Deployment

Application deployment can be achieved through the utilization of either a `Go` or `Flask` server, orchestrated using docker-compose, and hosted on the cloud self-hosting service provided by [Collify](). Please note that the Flask server resides on a distinct branch.
<br>
<br>

![](https://i.imgur.com/f9HgZ9F.png)