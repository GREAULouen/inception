FROM debian:buster-slim

# Install PHP and required extensions
RUN apt-get update && apt-get install -y \
	  php-fpm \
	  php-mysql && \
	rm -rf /var/lib/apt/lists/*

# Copy PHP-FPM configuration file
COPY conf/php-fpm.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php

COPY tools/script.sh /usr/local/bin/wp_script.sh
RUN chmod +x /usr/local/bin/wp_script.sh
ENTRYPOINT [ "/usr/local/bin/wp_script.sh" ]

WORKDIR /var/www/html/

# Expose port 9000
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.3", "-F"]