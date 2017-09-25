FROM ruby:2.3.3

RUN echo "deb http://cz.archive.ubuntu.com/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y --force-yes build-essential \
libpq-dev curl git libqt4-webkit libqt4-dev xvfb libjpeg-turbo8 vim nodejs \
postgresql-client nodejs curl

WORKDIR /tmp

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir /grape-api

WORKDIR /grape-api
ADD . /grape-api

CMD ["rackup", "-b", "0.0.0.0", "-p", "80"]
