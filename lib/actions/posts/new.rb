module Actions
  module Posts
    class New < Actions::Base
      def present
        self.presenter= Post.new
      end
    end
  end
end