module Actions
  module Posts
    class Show < Actions::Base
      def present
        self.presenter= Post.find(params[:id])
      end
    end
  end
end
