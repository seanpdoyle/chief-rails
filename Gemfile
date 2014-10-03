source 'https://rubygems.org'

ruby '2.1.2'

gem 'active_model_serializers'
gem 'aws-sdk'
gem 'clearance'
gem 'custom_configuration'
gem 'dalli'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'delayed_paperclip'
gem 'email_validator'
gem 'friendly_id', '5.0.4'
# gem 'geokit-rails', github: 'geokit/geokit-rails', branch: 'rails4'
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
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
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
