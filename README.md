# supervisor-httpd-vsftpd
This repository defines a docker image for an Apache and FTP Server with Supervisor. This image is based on vsftpd and httpd. You can configure the Supervisor user and password using environment variables $USER and $PASSWORD, and mount a volume "/vat/ftp" where files will be put.

## Base Docker Image
* centos

### Use of this image

You can use this repository to create a container with Apache and FTP server installed and it's maps on directory /var/www/html and for apache server and /var/ftp for ftp server for anonymous userss. This image is perfect in case when you need to launch more then one process inside a container.

## Build from source

**$ docker build -t="abatool/supervisor-httpd-vsftpd" github.com abatool/supervisor-httpd-vsftpd**

Install image from github.

## Pulling from Docker Hub

**$ docker pull abatool1/supervisor-httpd-vsftpd**

This command pull the image from docker hub.

## Docker run example:

### Prerequisites 

**$ docker network create supnet**
 
First, we need create a network that we will assign to containers, while create them that way, all the containers will be in the same network.

**$ docker run -d  --name vsftpd-httpd --network supnet -p 80:80 -p 9001:9001 -p 20-21:20-21 abatool1/supervisor-httpd-vsftpd**

Here we create a container with this image.    

With **--name** you can give a name to you container at container creation time.

With **--network*** create a subnet.

With **-p 80:80** Mapping the port **80** of the host machine to port **80** of the container, it’s the port that **Apache Server** use by default.

With **9001:9001** maps the port **9001** of the host machine to the supervisor **9001** of the container the is the where supervisor is listening from.

With **20-21:20-21** maps the ports **20** and **21**  of the host machine to the ** 20** and **21** of the container for **FTP Server**

We also use **-d** option for container to run in background and print container ID.

And also with **USER** and **PASSWORD** environment variable you can create a user its password for supervisor, at container creation time.

##Supervisor default login
Credentials using username and password:

username: www

password: iaw

You can also  change them using USER and PASSWORD environment variables.

###For example

docker run -d  --name container-name --network supnet -p 80:80 -p 9001:9001 -p 20-21:20-21 -USER=username -e PASSWORD=userpassword abatool1/supervisor-httpd-vsftpd**

 ##Access from browser or via Web

* Supervisor
 * http://host-ip:9001

* Apache Server
 * http://host-ip:80

* FTP Server
 * http://host-ip:21 or http://host-ip:20

# Docker inspect

**$ docker inspect container name o id**

This command list all the information about the container to see the mounted volumes we have go to the mount part and there we can see the source and the destination of a mounted volume.

## Inculde script
You can run the following script to create a network for the containers and a create container with FTP, APACHE and SUPERVISOR with this image (abatool1/supervisor-httpd-vsftpd) which maps the APACHE directory /var/www/html and FTP directory /var/ftp for anonymous user.

#/bin/bash

#Creation of a new network called supnet.

**docker network create wpnet**

#Creating a container named vsftpd-httpd with the image abatool1/datacontainer-nginx-db-wp which is mapping volumes /var/www/html for Apache and /var/ftp for FTP.

**docker run -d --name vsftps-httpd --network supnet -p 80:80 -p 9001:9001 -p 20-21:20-21 abatool1/supervisor-httpd-vsftpd**

## Authors
**Author:** Arfa Batool 

## Acknowledgments
The code was inspired by **orboan/docker-centos-supervisor-ssh** image.

