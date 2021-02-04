source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use Pry as your rails console
  gem 'pry-rails'
  # rspec-rails is a testing framework for Rails 5+
  gem 'rspec-rails', '~> 4.0', '>= 4.0.2'
  # Cucumber Generator and Runtime for Rails
  gem 'cucumber-rails', '~> 2.2.0', require: false
  # factory_bot_rails provides integration between factory_bot and rails 5.0 or newer
  gem 'factory_bot_rails', '~> 6.1'
  # Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 2.15', '>= 2.15.1'
  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners to test common Rails functionality that, if written by hand, would be much longer, more complex, and error-prone.
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  # RuboCop is a Ruby code style checking and code formatting tool. It aims to enforce the community-driven Ruby Style Guide
  gem 'rubocop', '~> 1.9', '>= 1.9.1', require: false
  # Automatic Rails code style checking tool. A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem 'rubocop-rails', '~> 2.9', '>= 2.9.1'
  # Code style checking for RSpec files. A plugin for the RuboCop code style enforcing & linting tool.
  gem 'rubocop-rspec', '~> 2.2'
  # A collection of RuboCop cops to check for downstream compatability issues in the Ruby code.
  gem 'rubocop-packaging', '~> 0.5.1'
  # A collection of RuboCop cops to check for performance optimizations in Ruby code.
  gem 'rubocop-performance', '~> 1.9', '>= 1.9.2'
end

group :test do 
# Extracting `assigns` and `assert_template` from ActionDispatch.
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Trace your model actions and create activity lists
gem 'hound', '~> 0.3.0'
# RubyCritic is a tool that wraps around various static analysis gems to provide a quality report of your Ruby code
gem 'rubycritic', '~> 4.6'
# Brakeman detects security vulnerabilities in Ruby on Rails applications via static analysis
gem 'brakeman', '~> 5.0'
# a code metric tool for rails codes, written in Ruby
gem 'rails_best_practices', '~> 1.20'

