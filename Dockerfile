FROM ruby:2.5.1

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

EXPOSE 4567

ENV RACK_ENV "development"

CMD [ "bundle", "exec", "rackup" ]
