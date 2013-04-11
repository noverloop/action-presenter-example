module Actions
  module Posts
    class Edit < Actions::Base
      def perform
        self.presenter= Post.find(params[:id])
      end
    end
  end
end
