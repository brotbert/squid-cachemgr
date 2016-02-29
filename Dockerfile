FROM ubuntu:14.04

# apt-get: switch to Germany-located archive pool
RUN sed -i.bak -e 's/\barchive\./de.&/' /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -yqq apache2-mpm-prefork apache2-utils squid-cgi

RUN a2enmod cgi
# Apache: Enable apache to serve /cgi-bin
RUN sed -i.bak -e '/serve-cgi-bin.conf/s/#//' /etc/apache2/sites-available/000-default.conf

# squid: Add custom cachemgr.conf
ADD cachemgr.conf /etc/squid/cachemgr.conf

CMD /usr/sbin/apache2ctl -D FOREGROUND
