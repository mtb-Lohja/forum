FROM httpd:2.4.33-alpine

# Install packages needed by YaBB
RUN apk add --no-cache \
    perl-lwp-useragent-determined \
    perl-crypt-ssleay \
    perl-cgi \
    perl-cgi-session

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./public-html/ /usr/local/apache2/htdocs/

# Trick to change permissions, first copy to tmp folder and then do on one go
# See https://serverfault.com/questions/772227/chmod-not-working-correctly-in-docker
COPY ./cgi-bin/yabb2 /yabb2
RUN mv /yabb2 /usr/local/apache2/cgi-bin && \
    chmod -R 777 /usr/local/apache2/cgi-bin/yabb2/Variables

EXPOSE 80