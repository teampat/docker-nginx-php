# docker-nginx-php #

This is a Dockerfile to build a container image for nginx and php-fpm.

## Version ##
nginx: stable

php: 5.6, 7.0

## Installation ##

    docker build -t teampat/nginx-php .

## Docker Pull Command ##

    docker pull teampat/nginx-php

For different PHP versions, you can find them under different tags:

- teampat/nginx-php:latest - PHP 7.0
- teampat/nginx-php:7.0 - PHP 7.0
- teampat/nginx-php:5.6 - PHP 5.6

## Running ##
To run the container:

    docker run --name nginx-php -p 8080:80 -d teampat/nginx-php
    
or

    docker run --name nginx-php -p 8080:80 -v /your_code_directory:/var/www/html -d teampat/nginx-php

    
To SSH into the running container:

    docker exec -i -t <containerID> bash
