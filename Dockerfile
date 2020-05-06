FROM composer as builder
RUN composer global require doctrine/migrations

FROM php:7.3-alpine
COPY --from=builder /tmp/vendor /tmp/vendor
RUN ln -s /tmp/vendor/bin/doctrine-migrations /bin/doctrine-migrations
CMD ["doctrine-migrations"]
