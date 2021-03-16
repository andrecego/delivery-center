FROM ruby:3.0

RUN apt-get update -qq && apt-get install -y postgresql-client vim

RUN mkdir -p /app/delivery_center
WORKDIR /app/delivery_center

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundler install

ADD . /app/delivery_center