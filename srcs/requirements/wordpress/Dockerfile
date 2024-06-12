FROM debian:buster

# Install PHP and required extensions
RUN apt-get update && apt-get install -y php-fpm php-mysql && \
	rm -rf /var/lib/apt/lists/*

# Copy PHP-FPM configuration file
COPY conf/php-fpm.conf /etc/php/7.3/fpm/pool.d/www.conf

# Expose port 9000
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.3", "-F"]