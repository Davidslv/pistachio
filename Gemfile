# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry'
  gem 'rspec'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop', require: false
end

group :test do
  gem 'simplecov', require: false
end
