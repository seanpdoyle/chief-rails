source 'https://rubygems.org'

ruby '2.0.0'

gem 'actionpack-page_caching'
gem 'airbrake'
gem 'bourbon'
gem 'clearance'
gem 'coffee-rails'
gem 'custom_configuration'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'email_validator'
gem 'flutie'
gem 'friendly_id', '5.0.0.beta1'
gem 'high_voltage'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'neat'
gem 'paperclip'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '>= 4.0.0'
gem 'recipient_interceptor'
gem 'sass-rails'
gem 'simple_form'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier'
gem 'unicorn'
gem 'workless', '~> 1.1.3'

group :development do
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'aws-sdk'
  gem 'newrelic_rpm', '>= 3.5.7'
  gem 'rails_12factor'
end
