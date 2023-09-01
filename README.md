# Portfolio Website

This static website is built using HTML, CSS, and JavaScript and served using a Go web server. It's designed to showcase your personal or professional projects, skills, and any other information you'd like to share with the world.

The website is containerized using Docker Compose for easy deployment and scaling.

## Docker Compose

Build and start the Docker containers using Docker Compose:

```bash
docker built -t web .
docker run -p 8080:8080 -t web
```

This command will build the Docker image for your website and start the container in detached mode.

You can now access your portfolio website by navigating to `http://localhost:8080` in your web browser.