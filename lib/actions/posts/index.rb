module Actions
  module Posts
    class Index < Actions::Base
      def present
        self.presenter= Post.all
      end
    end
  end
end