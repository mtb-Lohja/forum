FROM httpd:2.4.29-alpine

# Install packages needed by YaBB
RUN apk add --no-cache \
    perl-lwp-useragent-determined \
    perl-crypt-ssleay \
    perl-cgi \
    perl-cgi-session

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./public-html/ /usr/local/apache2/htdocs/
COPY ./cgi-bin/ /usr/local/apache2/cgi-bin/

EXPOSE 80