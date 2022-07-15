FROM ruby:2.7.3-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git bash openssh build-base postgresql-dev tzdata nodejs npm less

RUN mkdir -p /app
WORKDIR /app

ENV RUBYOPT="-W:no-deprecated -W:no-experimental"

ADD Gemfile* ./
RUN gem install bundler
RUN bundle install

ADD . .

ENTRYPOINT ["bin/entrypoint"]
EXPOSE 3000

# Start puma
CMD ["bin/rails", "server", "-b", "0.0.0.0"]