#/bin/bash

#Creation of a new network called supnet.

docker network create wpnet

#Creating a container named vsftpd-httpd with the image abatool1/datacontainer-nginx-db-wp which is mapping volumes /var/www/html for Apache and /var/ftp for FTP.

docker run -d --name vsftps-httpd --network supnet -p 80:80 -p 9001:9001 -p 20-21:20-21 abatool1/supervisor-httpd-vsftpd
