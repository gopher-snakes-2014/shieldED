source 'https://rubygems.org'
gem 'aws-sdk'
# Add Paperclip for image upload
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'gchart'
gem 'by_star', :git => "git://github.com/radar/by_star"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

gem 'foundation-rails'

gem 'pry'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'faker'
# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
group :development do
  gem 'spring'
  gem "dotenv-rails"
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end
