# Docker for testing

This environment is a docker base image for web-application-testing.  
It contains: 
* SSH
* Redis
* Elasticsearch 5.x
* RabbitMQ
* PostgreSQL
* NGINX
* PHP

## Images

There are multiply images based on each other:

1. :core
2. :environment
3. :php-73


## Usage

You have to create a Dockerfile in your project. For Spryker as example theres an template for that in spryker/_copy_to_project/.  
