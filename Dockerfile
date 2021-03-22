FROM debian:buster
# debian buster 설치

LABEL author="yeonkim@student.42seoul.kr"
# 작성자

RUN apt-get update
RUN apt-get install -y	nginx \
						php-fpm \
						openssl

# COPY /srcs/nginx/sites-available/default ./etc/nginx/sites-available/default

RUN service nginx start

WORKDIR /etc/nginx
# CMD 명령어가 실행될 경로로 이동

CMD ["nginx", "-g", "daemon off;"]
# nginx를 백그라운드로 실행

EXPOSE 80

RUN bash
