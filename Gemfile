# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib'

gem 'puma'
gem 'config'

gem 'pg'
gem 'sequel'

gem 'dry-initializer'
gem 'dry-validation'

gem 'rake'

gem 'i18n'
gem 'fast_jsonapi'
gem 'activesupport', require: false

group :development do
  gem 'byebug'
  gem 'sinatra-reloader'
  gem 'rubocop', require: false
end

group :test do
  gem 'rspec'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'database_cleaner-sequel'
end
