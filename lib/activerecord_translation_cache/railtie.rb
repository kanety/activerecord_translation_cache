# frozen_string_literal: true

module ActiverecordTranslationCache
  class Railite < Rails::Railtie
    ActiveSupport.on_load(:active_record) do
      ActiveModel::Name.prepend ActiverecordTranslationCache::Name
      ActiveModel::Translation.prepend ActiverecordTranslationCache::Translation
      ActiveRecord::Base.include ActiverecordTranslationCache::Translation
    end
  end
end
