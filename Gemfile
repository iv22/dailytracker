# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Authorization framework
gem 'action_policy', '~> 0.5.5'
gem 'active_model_serializers', '~> 0.10.12'
gem 'activerecord-import', '~> 1.0.8'
gem 'delayed_job_active_record', '~> 4.1.5'
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
# ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers', '~> 0.10.12'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# The administration framework for Ruby on Rails
gem 'activeadmin'
# Authentication
gem 'devise', '~> 4.7.3'
gem 'devise_invitable', '~> 2.0.3'
# OOP Delegator
gem 'draper', '~> 4.0.1'
gem 'phonelib', '~> 0.6.48'
# flexible components to create your forms
gem 'simple_form', '~> 5.1.0'
# simple template
gem 'slim-rails', '~> 3.2.0'

group :development, :test do
  # Shim to load environment variables from .env into ENV in development.
  gem 'dotenv-rails', '~> 2.7'
  # Call 'byebug' anywhere in the code to stop execution
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'json_spec', '~> 1.1.5'
  # Use Pry as your rails console
  gem 'pry-rails'
  # rspec-rails is a testing framework for Rails 5+
  gem 'rspec-rails', '~> 4.0', '>= 4.0.2'
  # Cucumber Generator and Runtime for Rails
  gem 'cucumber-rails', '~> 2.2.0', require: false
  # factory_bot_rails provides integration between factory_bot and rails 5.0+
  gem 'factory_bot_rails', '~> 6.1'
  # Faker is used to easily generate fake data
  gem 'faker', '~> 2.15', '>= 2.15.1'
  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners
  # to test common Rails functionality
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
end

group :development do
  # Annotates Rails/ActiveRecord Models and others based on the database schema
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  # Brakeman detects security vulnerabilities
  gem 'brakeman', '~> 5.0'
  gem 'listen', '~> 3.2'
  # a code metric tool for rails codes, written in Ruby
  gem 'rails_best_practices', '~> 1.20'
  # RuboCop is a Ruby code style checking and code formatting tool
  gem 'rubocop', '= 1.5.2', require: false
  # A collection of RuboCop cops to check for downstream compatability issues
  gem 'rubocop-packaging', '~> 0.5.1'
  # A collection of RuboCop cops to check for performance optimizations
  gem 'rubocop-performance', '~> 1.9', '>= 1.9.2'
  # Automatic Rails code style checking tool
  gem 'rubocop-rails', '~> 2.9', '>= 2.9.1'
  # Code style checking for RSpec files
  gem 'rubocop-rspec', '~> 2.2'
  # RubyCritic is a tool that wraps around various static analysis gems
  gem 'rubycritic', '~> 4.6'
  # sass linter
  gem 'scss_lint', '= 0.59.0', require: false
  # Spring speeds up development by keeping your application
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an interactive console on exception pages
  # or by calling 'console' anywhere in the code
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Extracting `assigns` and `assert_template` from ActionDispatch
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
