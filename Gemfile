source 'https://rubygems.org'
source 'https://rails-assets.org'

gem 'rails', '4.0.4'

# ruby server
gem 'thin'

# coffeescript->js compiler
gem 'therubyracer', platforms: :ruby

# Use postgresql as the database for Active Record
gem 'pg'

# file uploader
# gem 'carrierwave'
# gem 'mini_magick'

gem 'state_machine'

# Annotate models 
gem 'annotate'

# View decorator for models
gem 'draper'
gem 'active_model_serializers'

# Flexible authentication solution for Rails with Warden
gem 'devise'

# Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem 'figaro'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use twitter-bootstrap as frontend framework
gem 'bootstrap-sass'
gem 'bootstrap_helper'

# pagination
gem 'will_paginate'
gem 'will_paginate-bootstrap'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# A lightweight templating engine. Instead erb
gem 'slim-rails'

# markdown parser
gem 'github-markdown'

# Javascript syntax highlighter
gem 'rails-assets-highlightjs'

# An Embeddable JavaScript Markdown Editor
gem 'rails-assets-bootstrap-markdown'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'rails-assets-jquery-pjax'


group :development, :test do
  # Test frameworks
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'shoulda-matchers'
end

# Special gems for Travis integration
gem 'travis-lint', require: false
gem 'coveralls', require: false

gem 'codeclimate-test-reporter', group: :test, require: nil

group :production do
  #spesial for heroku deploy and logging
  gem 'rails_12factor'
end
