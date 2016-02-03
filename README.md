# docker-nginx-php7 #

Based on https://github.com/touchcast/docker-nginx-php7

This is a Dockerfile to build a container image for nginx and php7.0-fpm.

## Installation ##

    docker build -t teampat/nginx-php7 .

## Running ##
To run the container:

    docker run --name nginx-php7 -p 8080:80 -d teampat/nginx-php7

    docker run --name nginx-php7 -p 8080:80 -v /your_code_directory:/var/www/html -d teampat/nginx-php7

    
To SSH into the running container:

    docker exec -i -t <containerID> bash
    
