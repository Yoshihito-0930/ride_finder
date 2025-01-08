require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RideFinder
  class Application < Rails::Application
    # Other configurations...
    config.load_defaults 7.0
    config.i18n.default_locale = :ja
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    config.assets.enabled = true
    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.helper false             # helper ファイルを作成しない
      g.test_framework false     # test ファイルを作成しない
      g.skip_routes true         # ルーティングの記述を作成しない
    end
  end
end
