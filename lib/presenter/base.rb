module Presenter
  class Base < Hashie::Nash
    include Rails.application.routes.url_helpers
    include ActionView::Helpers
    include ActionView::Helpers::UrlHelper


    cattr_accessor :cacheable
    @@cacheable = false

    def cache *args, &block
      key = expand_cache_key(args)
      Rails.cache.fetch key, &block
    end

    def self.preheat bool
      @@cacheable = bool
    end

    def self.preheat?
      !!@@cacheable
    end

    def default_url_options
      { :host => "example.org", :only_path => true }
    end


  private
    def expand_cache_key(*args)
      ActiveSupport::Cache.expand_cache_key args
    end
  end
end