source 'https://rubygems.org'

#Gem for getting stuff from AWS
gem 'carrierwave', '~> 1.0'

#minimagick gem
gem "mini_magick"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'ransack'
# Use ransack for basic and advanced search function
gem 'rails', '5.0.1'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'
gem 'bootstrap-sass', '3.3.6'

# 

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Gems for testing
gem 'rails_12factor'
gem 'haml-rails'
gem 'selenium-webdriver'
gem 'poltergeist'
gem 'authlogic'
gem 'twilio-ruby'
gem 'rubocop'
gem 'simplecov'
gem 'masonry-rails'
gem 'table_print'

# Normalize.css is a customisable CSS file that makes browsers render all
#   elements more consistently and in line with modern standards.
gem 'normalize-rails'

# In order to avoid the json 1.8.1 bug
#   (https://travis-ci.org/CSC322-Grinnell/notifications/jobs/110022386), force
#   an unbroken version
gem 'json', '~>1.8.2'

group :development, :test do
  gem 'pry-byebug'
  gem 'byebug'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'test-unit'
  gem 'sqlite3'
end

#moved this group to :development
group :test do
  gem 'cucumber-rails'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  # CodeClimate reports test coverage and scores the DRYness and readibility of
  #  the project.
  gem 'codeclimate-test-reporter'
end

group :production do
  gem 'pg'
  gem 'heroku'
end

#  gem 'cucumber-rails', :require => true
#  # database_cleaner is not required, but highly recommended
#  gem 'database_cleaner'
#  # CodeClimate reports test coverage and scores the DRYness and readibility of
#  #  the project.
#  gem 'codeclimate-test-reporter'


group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
end

#fog gem
gem 'fog', '~> 1.38'

ruby "2.3.4"
