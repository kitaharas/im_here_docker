FROM ruby:2.6.8

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  nodejs\
  mariadb-server\
  mariadb-client

WORKDIR /Im_here_docker

COPY Gemfile /Im_here_docker/Gemfile
COPY Gemfile.lock /Im_here_docker/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets