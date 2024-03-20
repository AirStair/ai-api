FROM dunglas/frankenphp
EXPOSE 3478
RUN install-php-extensions \
	zip
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
WORKDIR /app
COPY . /app
RUN composer install
RUN frankenphp php-server -r /app/public
