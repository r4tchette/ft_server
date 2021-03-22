#!/bin/bash

# setup ssl
openssl req -newkey rsa:4096 -x509 -days 365 -nodes -subj "/C=KR/ST=GAEPO/L=Seoul/O=ECOLE42/OU=42SEOUL/CN=localhost" -keyout /etc/ssl/private/private.dev.key -out /etc/ssl/certs/private.dev.crt
chmod 600 etc/ssl/certs/private.dev.crt etc/ssl/private/private.dev.key

# install phpmyadmin
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin
mv config.inc.php /var/www/html/phpmyadmin/

# setup DB
service mysql start
mysql -u root --skip-password < var/www/html/phpmyadmin/sql/create_tables.sql
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "CREATE USER yeonkim@localhost IDENTIFIED by 'yeonkim';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* to yeonkim@localhost;" | mysql -u root --skip-password

# intall wordpress
tar -xvf latest.tar.gz
rm -rf latest.tar.gz
mv wordpress /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress
mv wp-config.php /var/www/html/wordpress/

# remove index for autoindexing
rm -rf /var/www/html/index.nginx-debian.html

# start services
service php7.3-fpm start
service nginx start
service mysql restart

bash
