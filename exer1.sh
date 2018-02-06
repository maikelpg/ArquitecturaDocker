#! /bin/bash


docker create --name datacontainer -v /var/www/html busybox

docker run --name michaelpg -it -d -p 80:80 --volumes-from datacontainer maikelpg/httpd-php

docker run --name db -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE1=wordpress -e MYSQL_USER1=wpress -e MYSQL_PASSWORD1=wpress --network exnet2 --volumes-from datacontainer orboan/dcsss-mariadb
