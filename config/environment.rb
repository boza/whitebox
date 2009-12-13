# Be sure to restart your server when you modify this file

RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/settings.yml")[RAILS_ENV]

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  
  config.gem 'haml'

  config.i18n.default_locale = :en

  config.action_mailer.default_url_options = { :host => APP_CONFIG['app_domain'] }

  if APP_CONFIG['allow_outgoing_email']
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
     :address        => APP_CONFIG['outgoing']['host'],
     :port           => APP_CONFIG['outgoing']['port'],
     :domain         => APP_CONFIG['outgoing']['from'],
     :user_name      => APP_CONFIG['outgoing']['user'],
     :password       => APP_CONFIG['outgoing']['pass'],
     :authentication => APP_CONFIG['outgoing']['auth'].to_sym
    }
  end

  require 'RedCloth'
  require 'mime/types'
end