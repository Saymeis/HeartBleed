FROM ubuntu:12.04
MAINTAINER bandit tg @Hi_Matherfucker

RUN     apt-get update           					&&\
        apt-get upgrade -y					        &&\
        apt-get install -y openssl=1.0.1-4ubuntu3        \
        				   php5-fpm=5.3.10-1ubuntu3.26	      \
        				   php5-common=5.3.10-1ubuntu3.26	      \
        				   nginx=1.1.19-1ubuntu0.8		\
        				   supervisor
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf

ADD supervisord.conf /etc/supervisor/supervisord.conf

COPY ./sites-enabled/ /etc/nginx/sites-enabled/
COPY ./keys/ /etc/nginx/ssl/
COPY ./nginx/www/ /usr/share/nginx/www/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]



#ADD     curl.sh /home/ubuntu
#CMD     openssl req -out CSR.csr -new -newkey rsa:2048 -nodes -keyout privateKey.key
#CMD     cd /home/ubuntu                            &&\
#        chmod -x curl
##RUN    openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.crt
##RUN    openssl req -out CSR.csr -key privateKey.key -new
##RUN    openssl x509 -x509toreq -in certificate.crt -out CSR.csr -signkey privateKey.key
## Копирования сайта 
##COPY /sites-enebled /etc/nginx/sites-enabled
##COPY /nginx  /usr/share/nginx
##CMD ["/home/ubuntu/curl.sh"]
