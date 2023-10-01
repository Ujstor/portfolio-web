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

# Load test

A website load test, also known as a web load test or performance test, is a type of testing that assesses how a website or web application performs under a simulated load or stress. The primary goal of a load test is to determine how well a website or web application can handle a certain number of concurrent users or a specific level of traffic without experiencing performance issues such as slow page load times, errors, or crashes.

Key objectives of a website load test include:

- Performance Evaluation: Load testing helps measure the website's performance metrics, such as response times, page load times, and resource utilization, under varying levels of traffic.

- Capacity Planning: It assists in determining the website's capacity to handle user loads. This information is vital for scaling resources and infrastructure to meet demand.

- Identifying Bottlenecks: Load tests can uncover bottlenecks or performance issues in the website's architecture, such as slow database queries, inefficient code, or limited server resources.

- Stress Testing: Load tests can push the website to its limits to identify its breaking point and understand how it behaves under extreme conditions.

- Scalability Testing: Organizations use load testing to determine how well a website or application can scale horizontally (adding more servers) or vertically (upgrading server hardware) to accommodate increased loads.

## Load Test with Locust

This document provides a basic example of a load test script using [Locust](https://locust.io/), a popular open-source load testing tool. In this script, we demonstrate how to create a simple test scenario for a web application.

```
 locust -f test_file.py
```

![](https://i.imgur.com/lyroPV2.png)

![](https://i.imgur.com/Yi46bEX.png)

## Load Testing with Taurus and Apache JMeter

Basic configuration for running a load test using [Taurus](https://gettaurus.org/) in conjunction with [Apache JMeter](https://jmeter.apache.org/), a powerful open-source load testing tool. This example defines a simple load test scenario that simulates multiple users making HTTP requests to a single website using JMeter scripts.

```
bzt load-config.yml
```


### Detailed Load Testing Reports

Taurus offers detailed load testing reports that include various performance metrics, response times, error rates, and more. These reports are crucial for understanding how your application behaves under different load levels and for identifying potential performance bottlenecks.

Key features of Taurus load testing reports include:

- **Performance Metrics**: Reports include metrics such as throughput, response times, and transaction rates, allowing you to assess your application's performance comprehensively.

- **Error Analysis**: Detailed error logs and error rates help you identify issues that might occur under load and investigate the root causes.

- **Graphical Visualizations**: Graphs and charts visualize test results, making it easy to spot trends and anomalies.

- **Concurrency Analysis**: Understand how your application scales by examining concurrency levels during the test.

- **Assertions and Pass/Fail Criteria**: Taurus allows you to set pass/fail criteria based on performance thresholds or assertions, making it clear when your application is meeting its performance targets.

### Jenkins Integration

To make load testing an integral part of your software development process, you can seamlessly integrate Taurus load testing into Jenkins This integration streamlines the testing process and ensures that performance testing is consistently executed as part of your CI/CD pipeline.
This ensures that your web applications are rigorously tested for scalability and responsiveness, helping you deliver a high-quality user experience and preventing performance-related issues from reaching your production environment.