FROM ruby:2.3.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Fixes a rails-specific issue, see https://docs.docker.com/compose/rails/
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Switch to non-privileged user
RUN mkdir -p /var/www && chown www-data /var/www
USER www-data

WORKDIR /app

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN figaro install

COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
