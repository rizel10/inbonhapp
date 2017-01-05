require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Inbonhapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "London"
    config.active_record.default_timezone = :local

    config.autoload_paths << Rails.root.join('app/models/users')
    config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths << "#{Rails.root}/lib"
  end
end