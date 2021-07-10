# frozen_string_literal: true

module ActiverecordTranslationCache
  module Translation
    extend ActiveSupport::Concern

    def human_attribute_name(*args)
      if ActiverecordTranslationCache.enabled?
        ActiverecordTranslationCache.fetch(self, I18n.locale, args) { super }
      else
        super
      end
    end

    class_methods do
      def human_attribute_name(*args)
        if ActiverecordTranslationCache.enabled?
          ActiverecordTranslationCache.fetch(self, I18n.locale, args) { super }
        else
          super
        end
      end
    end
  end
end
