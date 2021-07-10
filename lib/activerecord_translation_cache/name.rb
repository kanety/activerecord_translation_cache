# frozen_string_literal: true

module ActiverecordTranslationCache
  module Name
    def human(*args)
      if ActiverecordTranslationCache.enabled?
        ActiverecordTranslationCache.fetch(self, I18n.locale, args) { super }
      else
        super
      end
    end
  end
end
