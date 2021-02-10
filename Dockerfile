FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client postgresql-server
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY . /myapp
RUN 
RUN bundle install
RUN rails db:create
RUN rails db:migrate
RUN rake assets:precompile

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
