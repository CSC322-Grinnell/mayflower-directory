FROM ruby:2.3.4

# Install dependencies required by rails
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Fixes a rails-specific issue, see https://docs.docker.com/compose/rails/
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Change the working directory of the container
RUN mkdir -p /srv && chown www-data /srv
WORKDIR /srv

# Switch to non-privileged user
RUN mkdir -p /var/www && chown www-data /var/www
USER www-data

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy source code into container
COPY . .

# Start the server on container startup
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
