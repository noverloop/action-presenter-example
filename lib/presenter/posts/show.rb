class Presenter::Posts::Show < Presenter::Base

   preheat true

   property :id, :required => false
   property :created_at, :required => false
   property :updated_at, :required => false
   property :title, :required => true
   property :body, :required => true
   property :published, :required => true
   property :model_name, :required => false, :default => "Post"
   property :posts_link
   property :presenter_created_at
   property :url

   def initialize(post)
     hash = cache post do
        post.attributes.merge(:posts_link => link_to('posts',:controller => :posts, :action => :index), :presenter_created_at => Time.now.to_i, :url => root_url)
     end
     super hash
   end
end