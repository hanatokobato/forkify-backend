FROM ruby:2.7.2-alpine

RUN apk add --update --no-cache \
    libxslt-dev libxml2-dev build-base postgresql-dev yarn git shared-mime-info \
    postgresql-client less bash

RUN gem install bundler

ENV GEM_HOME /app/vendor/bundle
ENV BUNDLE_PATH /app/vendor/bundle
ENV BUNDLE_BIN /app/vendor/bundle/bin
ENV PATH $BUNDLE_BIN:$BUNDLE_PATH/gems/bin:$PATH

RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

COPY ./wait-for-it.sh /
RUN chmod +x /wait-for-it.sh

WORKDIR /app

RUN addgroup -g 1000 appgroup

RUN adduser -D -u 1000 appuser -G appgroup

RUN chown -R appuser:appgroup /app

USER appuser
