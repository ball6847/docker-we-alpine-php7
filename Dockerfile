FROM alpine:edge
MAINTAINER ball6847@gmail.com

RUN apk add --update --no-cache \
    php-zip \
    php-pdo \
    php-pdo_mysql \
    php-pdo_sqlite \
    php-mcrypt \
    php-mbstring \
    php-ctype \
    php-json \
    php-opcache \
    php-fpm \
    php-mysqli \
    php-curl \
    php-dom \
    php-intl \
    php-iconv \
    php-phar \
    php-zlib \
    php-openssl \
    openssl \
    docker && \
    ln -s /usr/bin/php /usr/bin/php && \
    wget -qO- https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

ADD conf/ /etc/php/

ENTRYPOINT ["php-fpm"]
