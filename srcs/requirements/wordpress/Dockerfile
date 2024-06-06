FROM debian:12.5

RUN apt update -y && apt upgrade -y && apt install -y php-fpm

CMD [ "php-fpm8.2", "-F" ]