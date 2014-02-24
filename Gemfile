source 'https://rubygems.org'
source 'https://rails-assets.org'
ruby '2.1.0'
#ruby-gemset=brainwo

gem 'rails', '4.0.3'

# Use postgresql as the database for Active Record
gem 'pg'

# Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem 'figaro'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use twitter-bootstrap as frontend framework
gem 'bootstrap-sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# A lightweight templating engine. Instead erb
gem 'slim-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby'

group :development, :test do
  # Test frameworks
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
end

# Special gems for Travis integration
gem 'travis-lint', require: false
gem 'coveralls', require: false

group :production do
  #spesial for heroku deploy and logging
  gem 'rails_12factor'
end