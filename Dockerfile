FROM alpine:edge
MAINTAINER ball6847@gmail.com

RUN apk add --update --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    php7-zip \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_sqlite \
    php7-mcrypt \
    php7-json \
    php7-opcache \
    php7-fpm \
    php7-mysqli \
    php7-curl \
    php7-dom \
    php7-intl \
    php7-iconv \
    php7-phar \
    php7-zlib \
    php7-openssl \
    openssl \
    docker && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    wget -qO- https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

ADD conf/ /etc/php7/

ENTRYPOINT ["php-fpm7"]
