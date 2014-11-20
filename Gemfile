source 'https://rubygems.org'

ruby '2.1.2'

gem 'active_model_serializers', '~> 0.8.2'
gem 'activesupport-json_encoder'
gem 'aws-sdk'
gem 'custom_configuration'
gem 'daemons'
gem 'dalli'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'delayed_paperclip'
gem 'email_validator'
gem 'geocoder'
gem 'paperclip'
gem 'paperclip-location'
gem 'pg'
gem 'rack-cors'
gem 'rack-timeout'
gem 'rails', '>= 4.1.2'
gem 'rails-api'
gem 'recipient_interceptor'
gem 'skylight', '~> 0.4.3'
gem 'unicorn'
gem 'validate_url'
gem 'workless', '~> 1.2.2'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'newrelic_rpm', '>= 3.5.7'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'database_cleaner'
  gem 'json-schema'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'shoulda-matchers-json', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock', '1.15.0'
end

group :staging, :production do
  gem 'rails_12factor'
end
