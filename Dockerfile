FROM alpine:3.3
MAINTAINER ball6847@gmail.com

WORKDIR /var/www

RUN apk add --update --no-cache --force \
    --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
    php-zip \
    php-pdo \
    php-pdo_mysql \
    php-pdo_sqlite \
    php-mysqli \
    php-sqlite3 \
    php-mcrypt \
    php-ctype \
    php-json \
    php-gd \
    php-opcache \
    php-fpm \
    php-curl \
    php-dom \
    php-intl \
    php-iconv \
    php-phar \
    php-zlib \
    php-openssl \
    php-xml \
    php5-xdebug@edge \
    openssl \
    docker && \
    wget -qO- https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

ADD xdebug.ini /etc/php5/conf.d/
ADD conf/ /etc/php/
ADD entrypoint.sh /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
