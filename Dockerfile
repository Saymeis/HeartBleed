FROM ubuntu:12.04
MAINTAINER bandit tg @Hi_Matherfucker

RUN     apt-get update                        					&&\
        apt-get upgrade -y	         				            &&\
        apt-get install -y openssl=1.0.1-4ubuntu3                 \
        				   php5-fpm=5.3.10-1ubuntu3.26	          \
        				   php5-common=5.3.10-1ubuntu3.26         \
        				   nginx=1.1.19-1ubuntu0.8                \
        				   supervisor                             \
        				   curl                                   \
						   nmap                                   \
						   python2.7                              \
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf

ADD supervisord.conf /etc/supervisor/supervisord.conf

COPY ./sites-enabled/ /etc/nginx/sites-enabled/
COPY ./keys/ /etc/nginx/ssl/
COPY ./nginx/www/ /usr/share/nginx/www/
COPY ./www.conf /etc/php5/fpm/pool.d/www.conf
COPY ./curl.sh /usr/local/bin/
COPY ./heartbleed.py /tmp
RUN chmod +x /usr/local/bin/curl.sh &&\
    chmod +x /tmp/heartbleed.py

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
