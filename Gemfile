source 'https://rubygems.org'

gem 'rails', '4.1.6'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.3.4'
gem 'bootstrap-generators', '~> 3.3.1'
gem "haml-rails", "~> 0.9"

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'dotenv-rails', '~> 2.0.1'

gem 'foreman'
gem "figaro"
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'

gem 'twitter'


group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'capistrano'
  gem 'capistrano3-ubuntu-server-prepare'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
  gem 'capistrano3-nginx'
  gem 'capistrano-rvm'
  gem 'capistrano-sidekiq'
  gem 'capistrano-figaro-yml', '~> 1.0.1'
end

group :test do
  gem 'shoulda-matchers', require: false
end

group :production do
    gem 'unicorn'
end
