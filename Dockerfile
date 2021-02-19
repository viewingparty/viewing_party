FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir -p /tmp/rails/pids
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install
COPY . .
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
