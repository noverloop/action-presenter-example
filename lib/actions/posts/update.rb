module Actions
  module Posts
    class Update < Actions::Base
      attr_accessor :success
      def perform
        @post   = Post.find(params[:id])
        self.success = @post.update_attributes(params[:post])
      end

      def present
        self.presenter= @post
      end

      def respond
        respond_to do |format|
          if self.success
            format.html { redirect_to @post, notice: 'Post was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: presenter, status: :unprocessable_entity }
          end
        end
      end
    end
  end
end
