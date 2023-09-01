# Portfolio Website with Flask and Docker

This repository contains the code and instructions for creating a portfolio website using Flask and Docker. With this setup, you can easily run your portfolio website in a Docker container, making it easy to deploy and manage.

## Getting Started

Build the Docker image:

   ```bash
   docker compose up -d
   ```

This command will also start the Flask application inside a Docker container and expose it on port 5000.

## Configuration

Environment variables in .env: `KEY`: Replace this with your secret key for the website

 


You can access your portfolio website by opening a web browser and navigating to:

```
http://localhost:5000
```

## Stopping the Container

To stop the Docker container, you can use the following command:

```bash
docker stop <container_id> or docker compose down
```

Replace `<container_id>` with the ID of the running container, which you can find using `docker ps`.

