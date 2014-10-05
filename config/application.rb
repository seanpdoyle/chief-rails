require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Chief
  class Application < Rails::Application
    config.asset_host = ENV.fetch("ASSET_HOST")
    config.middleware.insert_before "ActionDispatch::Static", "Rack::Cors" do
      allow do
        origins ENV.fetch("ALLOW_ORIGIN")
        resource "*", headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end

    config.active_record.default_timezone = :utc

    config.x.paperclip.s3 = false
    config.x.workless.scaler = :local

    config.cache_store = :dalli_store

    config.action_controller.action_on_unpermitted_parameters = :raise

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.enforce_available_locales = true
  end
end
