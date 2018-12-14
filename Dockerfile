FROM ubuntu:12.04
#
MAINTAINER bandit tg @Hi_Matherfucker
#Тут нужно сделать выполнения этого скрипта
ADD	curl.sh /home/ubuntu

RUN	apt-get update                             &&\
	apt-get upgrade -y			   &&\
	apt-get install debconf -y		   &&\
	apt-get install apt-utils -y               &&\
	apt-get install openssl=1.0.1-4ubuntu3 -y  &&\
	apt-get update                             &&\
	apt-get install php5 -y			   &&\
        apt-get install nginx=1.1.19-1ubuntu0.8 -y &&\
CMD	openssl req -out CSR.csr -new -newkey rsa:2048 -nodes -keyout privateKey.key
CMD	cd /home/ubuntu                            &&\
	chmod -x curl				   
#RUN	openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.crt
#RUN	openssl req -out CSR.csr -key privateKey.key -new
#RUN	openssl x509 -x509toreq -in certificate.crt -out CSR.csr -signkey privateKey.key
# Копирования сайта 
#COPY /sites-enebled /etc/nginx/sites-enabled
#COPY /nginx  /usr/share/nginx
#CMD ["/home/ubuntu/curl.sh"]
