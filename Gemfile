source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'slim-rails'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'sidekiq'
gem 'sidetiq'
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'redis'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker', github: 'stympy/faker'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry'
  gem 'pry-nav'
end
