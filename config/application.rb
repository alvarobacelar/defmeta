require_relative 'boot'

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Defmetas
  class Application < Rails::Application

    config.app_generators.scaffold_controller :responders_controller
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config = Rails.application.config
    config.time_zone = 'Buenos Aires'
    config.encoding = "utf-8"
    config.i18n.default_locale = 'pt-BR'
    I18n.enforce_available_locales = false
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
    end

  end
end
