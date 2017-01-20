config = Rails.application.config
config.time_zone = 'Brasilia'
config.i18n.default_locale = 'pt-BR'
config.generators do |g|
  g.stylesheets false
  g.javascripts false
end
