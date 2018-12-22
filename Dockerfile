FROM ubuntu:12.04

MAINTAINER bandit tg @Hi_Matherfucker

RUN     apt-get update                            &&\
        apt-get upgrade -y                        &&\
        apt-get install -y --force-yes  openssl=1.0.1-4ubuntu3  \
		libssl1.0.0=1.0.1-4ubuntu3          \
		php5-fpm=5.3.10-1ubuntu3.26	    \
		php5-common=5.3.10-1ubuntu3.26      \
		nginx=1.1.19-1ubuntu0.8             \
		curl                                \
		supervisor                                  

RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf

ADD supervisord.conf /etc/supervisor/supervisord.conf

COPY ./sites-enabled/ /etc/nginx/sites-enabled/
COPY ./keys/ /etc/nginx/ssl/
COPY ./nginx/www/ /usr/share/nginx/www/
COPY ./www.conf /etc/php5/fpm/pool.d/www.conf

ADD ./curl.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/curl.sh 
#RUN openssl req -newkey rsa:2048 -nodes -keyout heartbleed.key -out hearbleed.csr &&\
#openssl req -key heartbleed.key -new -out heartbleed.csr &&\
#openssl genrsa -des3 -out heartbleed.key 2048 &&\
#openssl x509 -in heartbleed.crt -signkey heartbleed.key -x509toreq -out heartbleed.csr &&\
#openssl x509 -signkey heartbleed.key -in heartbleed.csr -req -days 365 -out heartbleed.crt 

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
