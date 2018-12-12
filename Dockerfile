FROM ubuntu:12.04
#
MAINTAINER bandit tg @Hi_Matherfucker

RUN	apt-get update 
RUN	apt-get install debconf -y
RUN	apt-get install apt-utils -y 
RUN	apt-get install openssl=1.0.1-4ubuntu3 -y
RUN	apt-get install nginx=1.1.19-1ubuntu0.8 -y
RUN	apt-get install php=5.3.10-1ubuntu3.26 -y






# Копирования сайта 
#COPY /sites-enebled /etc/nginx/sites-enabled
#COPY /nginx  /usr/share/nginx

#Тут нужно сделать выполнения этого скрипта 
#ADD curl.sh /home/ubuntu

# Узнать в какую папку запихивать
#ADD https://www.openssl.org/source/old/1.0.1/openssl-1.0.1f.tar.gz !!#<место>!! 






#CMD ["/home/ubuntu/curl.sh"]
