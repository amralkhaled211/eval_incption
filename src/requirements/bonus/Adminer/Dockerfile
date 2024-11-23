FROM debian:bullseye

# Install prerequisites
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -y \
    curl \
    mariadb-client \
    php \
    php-fpm \
    php-common \
    php-intl \
    php-json \
    php-gd \
    php-curl \
    php-xml \
    php-mysql \
    php-imap \
    php-pdo \
    php-soap \
    php-posix \
    gettext \
    php-ldap \
    php-ctype \
    php-dom \
    php-simplexml && \
    apt-get clean

# Create necessary directories
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

# Download Adminer
RUN curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mkdir -p /var/www/html && \
    mv ./adminer-4.8.1.php /var/www/html/index.php && \
    if ! id "www-data" >/dev/null 2>&1; then \
        useradd -u 82 -d /var/www -s /usr/sbin/nologin -g www-data www-data; \
    fi

# Copy PHP-FPM configuration
COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Expose port
EXPOSE 9000

# Set stop signal
STOPSIGNAL SIGQUIT

# Start PHP-FPM
CMD ["php-fpm7.4", "--nodaemonize"]