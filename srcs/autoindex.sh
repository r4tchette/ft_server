#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "$# is Illegal number of parameters."
	echo "Usage: $0 [0 or 1]"
	exit 1
fi

if [ "$1" -eq 1 ]; then
	cp ./default_autoindex_on ./etc/nginx/sites-available/default
	echo "Autoindex: on"
elif [ "$1" -eq 0 ]; then
	cp ./default_autoindex_off ./etc/nginx/sites-available/default
	echo "autoindex: off"
else
	echo "Usage : $0 [0 or 1]"
fi

service php7.3-fpm restart
service nginx restart
service mysql restart

exit 0
