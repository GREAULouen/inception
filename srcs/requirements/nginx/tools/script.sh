#!/bin/bash
# Wait until WordPress container is resolvable and reachable on port 9000

until nc -z wordpress 9000; do
  echo "Waiting for wordpress:9000 to be available..."
  sleep 1
done

echo "WordPress is up. Starting NGINX..."
nginx -g "daemon off;"