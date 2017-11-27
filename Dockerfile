FROM ruby:2.4.0

RUN apt-get update && apt-get install -qq -y build-essential

ENV INSTALL_PATH /api

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile $INSTALL_PATH/Gemfile

RUN bundle install

COPY . $INSTALL_PATH

CMD bundle exec rails s -b '0.0.0.0'
