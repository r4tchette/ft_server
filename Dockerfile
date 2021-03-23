FROM debian:buster

LABEL author="yeonkim@student.42seoul.kr"

RUN apt-get update
RUN apt-get install -y	nginx \
						php-fpm \
						vim \
						openssl \
						mariadb-server \
						php-mysql

COPY ./srcs/default_autoindex_on ./etc/nginx/sites-available/default
COPY ./srcs/default_autoindex_on ./
COPY ./srcs/default_autoindex_off ./
COPY ./srcs/phpMyAdmin-5.0.2-all-languages.tar.gz ./
COPY ./srcs/config.inc.php ./
COPY ./srcs/latest.tar.gz ./
COPY ./srcs/wp-config.php ./
COPY ./srcs/run.sh ./
COPY ./srcs/autoindex.sh ./

EXPOSE 80 443

CMD bash run.sh
