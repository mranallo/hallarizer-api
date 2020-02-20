FROM ruby:2.6-alpine

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME

RUN gem install bundler
RUN bundle install

EXPOSE 80

CMD ["bundle", "exec", "rackup", "app.rb","--host", "0.0.0.0", "-p", "80"]
