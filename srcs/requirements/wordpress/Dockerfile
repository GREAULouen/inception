FROM debian:bookworm

# Add Sury PHP repo to install legacy PHP versions
RUN apt-get update && apt-get install -y \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    wget && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

# Install PHP 7.4 and required extensions
RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-imagick \
    php7.4-dom \
    php7.4-zip \
    curl \
    netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Copy PHP-FPM config (make sure the path matches PHP 7.4)
COPY conf/php-fpm.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

WORKDIR /var/www/html/

EXPOSE 9000

COPY tools/script.sh /usr/local/bin/wp_script.sh
RUN chmod +x /usr/local/bin/wp_script.sh
ENTRYPOINT [ "/usr/local/bin/wp_script.sh" ]
