# frozen_string_literal: true

require 'active_support'

require 'activerecord_translation_cache/middleware'
require 'activerecord_translation_cache/name'
require 'activerecord_translation_cache/translation'
require 'activerecord_translation_cache/railtie' if defined?(Rails)

module ActiverecordTranslationCache
  CACHE_KEY = :activerecord_translation_cache

  class << self
    def enable
      Thread.current[CACHE_KEY] = {}
      yield
    ensure
      Thread.current[CACHE_KEY] = nil
    end

    def enabled?
      cache != nil
    end

    def cache
      Thread.current[CACHE_KEY]
    end

    def fetch(*keys)
      keys[0..-2].inject(cache) { |hash, key|
        hash[key] ||= {}
      }[keys.last] ||= yield
    end
  end
end
