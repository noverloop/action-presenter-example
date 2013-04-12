module Actions
  module Posts
    class Show < Actions::Base
      def present
        self.presenter= Presenter::Posts::Show.new Post.find(params[:id])
      end
    end
  end
end
