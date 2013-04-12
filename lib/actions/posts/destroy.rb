module Actions
  module Posts
    class Destroy < Actions::Base
      def perform
        @post = Post.find(params[:id])
        @post.destroy
      end

      def respond
        respond_to do |format|
          format.html {redirect_to rails.posts_url, notice: "Succesfully deleted"}
          format.json { render status: 200 }
        end
      end
    end
  end
end