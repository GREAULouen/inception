FROM debian:buster-slim

# Install PHP and required extensions
RUN apt-get update && apt-get install -y \
	  php7.3-fpm \
	  php7.3-mysql \
		curl \
		netcat && \
	rm -rf /var/lib/apt/lists/*

# Copy PHP-FPM configuration file
COPY conf/php-fpm.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php

WORKDIR /var/www/html/

# Expose port 9000
EXPOSE 9000

COPY tools/script.sh /usr/local/bin/wp_script.sh
RUN chmod +x /usr/local/bin/wp_script.sh
ENTRYPOINT [ "/usr/local/bin/wp_script.sh" ]