FROM debian:buster

# Install NGINX
RUN apt-get update && apt-get install -y \
	  nginx && \
	rm -rf /var/lib/apt/lists/*

# Copy NGINX configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Create required directories
RUN mkdir -p /run/nginx

# Expose port 80 and 443
EXPOSE 80 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]