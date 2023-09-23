# Portfolio Website with Flask and Docker

This repository contains the code and instructions for creating a portfolio website using Flask and Docker. With this setup, you can easily run your portfolio website in a Docker container, making it easy to deploy and manage.

![](https://i.imgur.com/f9HgZ9F.png)

# Getting Started

1. Clone git repo

2. Create and add credentials in `.env` file
    ```
    KEY=            #random string
    ```
3. Run `python main.py`

4. Open `127.0.0.1:5000` in local browser

# Docker

To build the Docker image from the code, run:

```
docker compose -f .\docker-compose-dev.yml up
```

If you want to pull the image from the Docker repository instead, use:

```
docker compose -f .\docker-compose-prod.yml up
```

Image is automatically built and deployed through the Jenkins pipeline after changes in GitHub, and it expects a .env file for loading variables.

<br/>

![]()

<br/>

![]()

