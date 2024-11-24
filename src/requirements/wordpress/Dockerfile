FROM debian:bullseye

# Update and install php-fpm
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -y php7.4-fpm \
    php7.4-mysql \
    default-mysql-client \
    curl

# Create the /run/php directory
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
RUN mkdir -p html
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY tools/script.sh .
RUN chmod +x script.sh

CMD ["./script.sh"]