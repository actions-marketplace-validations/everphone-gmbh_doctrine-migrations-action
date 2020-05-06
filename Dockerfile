FROM composer as builder
RUN composer global require doctrine/migrations
# allows doctrine-migrations to read yml configuration files
RUN composer global require symfony/yaml

FROM php:7.3-alpine
RUN docker-php-ext-install mysqli
COPY --from=builder /tmp/vendor /tmp/vendor
RUN ln -s /tmp/vendor/bin/doctrine-migrations /bin/doctrine-migrations
CMD doctrine-migrations $INPUT_COMMAND
