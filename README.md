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
3. :testing


## Usage

To use this environment copy the content from the directory "_copy_to_project" into the root directory of your project.  
Then you can build your testing environment:

```
docker build -t localtesting .
```

To start the contaienr run
***Once***:
```
docker run --name localtest -p 2222:22 -v $(pwd):/data/docker/testing -v $(pwd)/testinglogs:/data/docker/logs localtesting
```  
