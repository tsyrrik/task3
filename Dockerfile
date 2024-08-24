FROM php:8.3-fpm

# Установите необходимые расширения PHP
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install zip \
    && pecl install redis \
    && docker-php-ext-enable redis

WORKDIR /var/www/html

COPY composer.json composer.lock ./


COPY . .

CMD ["php-fpm"]
