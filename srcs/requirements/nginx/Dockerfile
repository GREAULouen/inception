FROM debian:12.5

RUN apt update -y && apt upgrade -y && apt install -y nginx

COPY conf/default nginx:/etc/nginx/sites-available/default

CMD [ "nginx", "-g", "daemon off;" ]