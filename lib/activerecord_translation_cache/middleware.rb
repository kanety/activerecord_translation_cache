# frozen_string_literal: true

module ActiverecordTranslationCache
  class Middleware
    def initialize(app)
      @app = app
    end
  
    def call(env)
      ActiverecordTranslationCache.enable do
        @app.call(env)
      end
    end
  end
end
