require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RoomBooking
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.load_path += Dir[Rails.root
    .join("config", "locales", "**", "*.{rb,yml}")]
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.assets.paths << Rails.root.join("vendor", "assets", "images")
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
