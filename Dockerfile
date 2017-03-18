FROM ubuntu
MAINTAINER Andrzej Lichnerowicz <andrzej@lichnerowicz.pl>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        nginx \
        supervisor \
        php7.0-fpm php7.0-cli php7.0-curl php7.0-gd php7.0-json php7.0-pgsql php7.0-mcrypt php7.0-mbstring php-fdomdocument
        

ADD ttrss.nginx.conf /etc/nginx/sites-available/ttrss
RUN ln -s /etc/nginx/sites-available/ttrss /etc/nginx/sites-enabled/ttrss
RUN rm /etc/nginx/sites-enabled/default

WORKDIR /var/www
RUN rm -rf /var/www/html

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl --no-install-recommends \
    && curl -SL https://tt-rss.org/gitlab/fox/tt-rss/repository/archive.tar.gz?ref=master | tar xzC /var/www --strip-components 1 \
    && apt-get purge -y --auto-remove curl \
    && chown www-data:www-data -R /var/www
RUN cp config.php-dist config.php

EXPOSE 80        

ENV SELF_URL_PATH http://localhost
ENV DB_NAME ttrss
ENV DB_USER postgres
ENV DB_PASS ttrss

ADD configure /configure
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /run/php
RUN chmod a+x /configure
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

CMD /configure && supervisord -c /etc/supervisor/conf.d/supervisord.conf
