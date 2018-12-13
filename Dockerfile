FROM ubuntu:12.04
#
MAINTAINER bandit tg @Hi_Matherfucker

RUN	apt-get update 
RUN	apt-get upgrade -y
RUN	apt-get install debconf -y
RUN	apt-get install apt-utils -y 
RUN	apt-get install openssl=1.0.1-4ubuntu3 -y
RUN	apt-get update &&\
	apt-get install php5 -y
RUN     apt-get install nginx=1.1.19-1ubuntu0.8 -y
RUN	openssl req -out CSR.csr -new -newkey rsa:2048 -nodes -keyout privateKey.key
RUN	openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.crt










# Копирования сайта 
#COPY /sites-enebled /etc/nginx/sites-enabled
#COPY /nginx  /usr/share/nginx

#Тут нужно сделать выполнения этого скрипта 
#ADD curl.sh /home/ubuntu

# Узнать в какую папку запихивать
#ADD https://www.openssl.org/source/old/1.0.1/openssl-1.0.1f.tar.gz !!#<место>!! 






#CMD ["/home/ubuntu/curl.sh"]
