source 'https://rubygems.org'

ruby '2.1.2'

gem 'active_model_serializers', '~> 0.8.1'
gem 'aws-sdk'
gem 'clearance'
gem 'custom_configuration'
gem 'dalli'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'email_validator'
gem 'geokit-rails'
gem 'paperclip'
gem 'paperclip-location'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '>= 4.1.2'
gem 'rails-api'
gem 'recipient_interceptor'
gem 'unicorn'
gem 'workless', '~> 1.2.2'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
  gem 'meta_request'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'database_cleaner'
  gem 'json-schema'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock', '1.15.0'
end

group :development, :staging do
  gem 'bullet'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.5.7'
  gem 'rails_12factor'
end
