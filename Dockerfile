FROM ubuntu:12.04
#
MAINTAINER bandit tg @Hi_Matherfucker

RUN	apt-get update 
RUN	apt-get install apt-utils &&\
	apt-get install openssl=1.0.1-4ubuntu3








# Копирования сайта 
#COPY /sites-enebled /etc/nginx/sites-enabled
#COPY /nginx  /usr/share/nginx

#Тут нужно сделать выполнения этого скрипта 
#ADD curl.sh /home/ubuntu

# Узнать в какую папку запихивать
#ADD https://www.openssl.org/source/old/1.0.1/openssl-1.0.1f.tar.gz !!#<место>!! 






#CMD ["/home/ubuntu/curl.sh"]
