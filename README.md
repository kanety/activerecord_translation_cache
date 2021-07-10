# ActiverecordTranslationCache

A memoized cache for ActiveRecord translations.

## Dependencies

* ruby 2.5+
* activesupport 6.0+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord_translation_cache'
```

Then execute:

    $ bundle

## Usage

Enable cache as follows:

```ruby
ActiverecordTranslationCache.enable do
  puts ItemModel.human_attribute_name(:column) # cached
  puts ItemModel.human_attribute_name(:column) # cache hit
  puts ItemModel.model_name.human # cached
  puts ItemModel.model_name.human # cache hit
end
```

In the `enable` block, return values of `human_attribute_name` and `human` are cached for each model,
and cache is used at next call.
Note that cache is cleared when block is end.

### Rack middleware

Rack middleware is available when you want to enable cache globally:

```ruby
Rails.application.config.middleware.use ActiverecordTranslationCache::Middleware
```

## Contributing

Bug reports and pull requests are welcome at https://github.com/kanety/activerecord_translation_cache.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
