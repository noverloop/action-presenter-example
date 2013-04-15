module Presenter
  module Posts
    class Create < Presenter::Base

       model Post
       property :status, :required => false, :default => true

       def initialize *args
         h = args[1] || {}
         h[:post] = args.first.attributes
         super(h)
       end

    end
  end
end