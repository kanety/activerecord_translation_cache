require_relative 'boot'

require "active_record/railtie"
require "active_model/railtie"
require "active_job/railtie"

Bundler.require(*Rails.groups)
require "activerecord_translation_cache"

module Dummy
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    #config.middleware.use ActiverecordTranslationCache::Middleware
  end
end
