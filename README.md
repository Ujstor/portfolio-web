# Portfolio Website with Flask and Docker

This repository contains the code and instructions for creating a portfolio website using Flask and Docker. With this setup, you can easily run your portfolio website in a Docker container, making it easy to deploy and manage.

![](https://i.imgur.com/pi1WaHy.png)

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

Image is automatically built and deployed through the Jenkins pipeline after changes in GitHub.

<br/>

![](https://i.imgur.com/4wmQpYy.png)

<br/>

# Testing

In simple terms, test code checks if a website works correctly. It does this by:


1. **Testing the Home Page**: It makes sure the main page of the website looks right.

2. **Testing External Links**: It checks if links to other websites are working.

3. **Checking Links on the Page**: It looks at all the links on the website to make sure they point to the right places.

After these tests pass successfully, a Docker image is created and the website is deployed through a Jenkins pipeline.

![](https://i.imgur.com/Phi3UVh.png)
