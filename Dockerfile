FROM dunglas/frankenphp
RUN install-php-extensions \
	zip
WORKDIR /app
COPY . /app
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
RUN composer install
RUN frankenphp php-server -r /app/public -l ${FRANKENPHP_SERVER_ADDRESS}
