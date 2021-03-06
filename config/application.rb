require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ForoFEUCR
  class Application < Rails::Application
  	config.assets.paths << "#{Rails}/vendor/assets/fonts"
  	config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile += %w(*.js)
  	config.action_view.embed_authenticity_token_in_remote_forms = true
  	
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_dispatch.default_headers.merge!({'X-Frame-Options' => 'ALLOWALL'})
    
  end




end
