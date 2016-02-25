require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FtghubApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Disable most of the extra content which is no neeed
    config.generators do |g|
        g.stylesheets    false
        g.assets         false
        g.helper         false
    end

    # 在处理 Ajax 的表单中添加真伪令牌
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
