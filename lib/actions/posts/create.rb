module Actions
  module Posts
    class Create < Actions::Base
      attr_accessor :success

      def perform
        @post = Post.new(params[:post])
        self.success = @post.save
      end

      def present
        self.presenter = @post
        #Presenters::Posts::Post.new(@post, status: self.success)
      end

      def respond
         respond_to do |format|
            if success
              format.html { redirect_to @post, notice: 'Post was successfully created.' }
              format.json { render json: presenter, status: :created, location: @post }
            else
              format.html { render action: "new" }
              format.json { render json: presenter, status: :unprocessable_entity }
            end
          end
      end
    end
  end
end