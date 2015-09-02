source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.4'
gem 'pg', '~> 0.18.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails', '~> 4.0.4'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'sidekiq', '~> 3.4.2'
gem 'celluloid', '0.16.0'
gem 'has_secure_token', '~> 1.0.0'

gem 'sinatra', :require => nil

group :development, :test do
  gem 'byebug', '~> 6.0.2'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.5.0'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring', '~> 1.3.6'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end

group :test do
  gem 'webmock', '~> 1.21.0'
  gem 'database_cleaner', '~> 1.4.1'
  gem 'capybara', '~> 2.4.4'
  gem "codeclimate-test-reporter", '~> 0.4.7', require: nil
end
