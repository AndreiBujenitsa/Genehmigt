# Load application configuration
require 'ostruct'
require 'yaml'
config = YAML.load_file("#{Rails.root}/config/app.yml") || {}
AppConfig = OpenStruct.new(config[Rails.env])

Devise.mailer_sender = AppConfig.sender_email

