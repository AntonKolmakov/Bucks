source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.4', '>= 5.2.4.2'
gem 'puma', '~> 3.11'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'foreman'
gem 'httparty'
gem 'whenever', require: false
gem 'sidekiq', '~> 5.1', '>= 5.1.1'

# DBs
gem 'pg'
gem 'redis'

# Auth
gem 'devise'
gem 'pundit'
gem 'frondit', '~> 0.0.2.2', github: 'jpmobiletanaka/frondit'

#frontend
gem 'bootstrap-sass'
gem 'bootstrap-toggle-rails'
gem 'bootstrap-wysihtml5-rails'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'webpacker'

group :development, :test do
  gem 'factory_bot_rails', '~> 4.8'
  gem 'faker'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'webmock'
  gem 'database_cleaner'
  gem 'action-cable-testing'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
