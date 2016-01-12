# Use the latest Ubuntu base image
FROM ubuntu:trusty

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN apt-get update -qqy && apt-get install -qqy software-properties-common python-software-properties

# Install nginx and php7 packages
RUN add-apt-repository -y ppa:ondrej/php-7.0 && apt-get update -qqy

RUN apt-get install -qqy \
    python-setuptools \
    curl \
    supervisor \
    nginx \
    php7.0-fpm \
    php7.0-cli \
    php7.0-common \
    php7.0-curl \
    php7.0-json \
    php7.0-gd \
    php7.0-mcrypt \
    php7.0-odbc \
    php7.0-pgsql \
    php7.0-mysql \
    php7.0-xmlrpc \
    php7.0-opcache \
    php7.0-intl \
    php7.0-bz2

COPY conf/php/www.conf /etc/php/7.0/fpm/pool.d/www.conf
COPY conf/php/php.ini /etc/php/7.0/fpm/php.ini
COPY conf/php/php.ini /etc/php/7.0/cli/php.ini
COPY conf/php/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf

COPY conf/nginx/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx/vhost /etc/nginx/sites-available/default

COPY index.php /usr/share/nginx/html/index.php

# Supervisor Config
ADD conf/supervisor/01_php-fpm.conf /etc/supervisor/conf.d/01_php-fpm.conf
ADD conf/supervisor/02_nginx.conf /etc/supervisor/conf.d/02_nginx.conf

RUN mkdir /run/php && chown www-data.www-data -R /run/php

# Drupal Initialization and Startup Script
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# private expose
EXPOSE 80

CMD ["/bin/bash", "/start.sh"]