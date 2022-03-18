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


RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn postgresql-client