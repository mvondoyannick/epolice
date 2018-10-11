require_relative 'boot'

require 'csv'
#require 'iconv'
require 'roo'
require 'prawn'
require 'faker'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

#ENV['RAILS_ADMIN_THEME'] = 'rollincode'

module E
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
