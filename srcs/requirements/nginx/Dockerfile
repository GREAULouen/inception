FROM debian:buster-slim

# Install NGINX
RUN apt-get update && apt-get install -y \
	  nginx \
	  openssl

# SSL setup
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	  -out /etc/nginx/ssl/lgreau.crt \
	  -keyout /etc/nginx/ssl/lgreau.key \
	  -subj "/C=DE/ST=Heilbronn/L=Heilbronn/O=42 School/OU=lgreau/CN=lgreau/"

# Copy NGINX configuration file
COPY conf/nginx.conf /etc/nginx/conf.d

# Create required directories
RUN mkdir -p /run/nginx

# Expose port 443
EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]