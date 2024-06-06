FROM debian:12.5

RUN apt update -y && apt upgrade -y && apt install -y nginx

CMD [ "nginx", "-g", "daemon off;" ]