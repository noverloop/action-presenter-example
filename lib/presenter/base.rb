module Presenter
  class Base < Hashie::Nash
    include Rails.application.routes.url_helpers
    include ActionView::Helpers
    include ActionView::Helpers::UrlHelper

    def self.model klass
      property klass.to_s.underscore.to_sym do
        klass.attribute_names.each do |name|
          property name.to_sym
        end

        def self.model_name
          self.name.to_s.split(":").last
        end
      end

    end

    def cache *args, &block
      key = expand_cache_key(args)
      Rails.cache.fetch key, &block
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