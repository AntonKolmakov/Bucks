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
gem 'pg'

#frontend
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'bootstrap-toggle-rails', '~> 2.2', '>= 2.2.1.0'
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
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
