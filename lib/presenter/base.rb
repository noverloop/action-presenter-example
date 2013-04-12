module Presenter
  class Base < Hashie::Nash
    include ActionView::Helpers
    include Rails.application.routes.url_helpers

=begin
There are two major things to consider with presenters
Factorisation, the creation of the presenter
Caching and the ability of offline caching
Actual viewlogic that is calculated from the coredata and helpers which generate html_safe view-items.

So if we consider that the presenter contains
1. core data
2. caching logic
3. dataspecific html-snippets. (aka. view helpers)

In this case we can spec out the requirements needed for each part.

The core data needs validation as a view may not render with lacking core-data
- validated on initialization
- cachable

pseudo logic

when the object recovers from cache we want to skip the super's initialize method
when the object is not recovered from cache we want to initialize
except

so basically we want to override the initialize method
so caching is postponed to the presenters logic because.. easier
=end
    cattr_accessor :cacheable
    @@cacheable = false

    def cache *args, &block
      key = expand_cache_key(args)
      Rails.cache.fetch key, &block
    end

  private
    def expand_cache_key(*args)
      ActiveSupport::Cache.expand_cache_key args
    end
  end
end