#!/bin/sh

if [[ -L "/etc/php/conf.d/xdebug.ini" ]]; then
    unlink /etc/php/conf.d/xdebug.ini
fi

if [[ "$ENABLED_XDEBUG" != "" ]]; then
    ln -s /etc/php5/conf.d/xdebug.ini /etc/php/conf.d/xdebug.ini
fi

exec php-fpm
