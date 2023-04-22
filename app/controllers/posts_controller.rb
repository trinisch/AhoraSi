class PostsController < ApplicationController

    def index
        @posts = Post.all
      end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = current_user.posts.new(post_params)
    
        respond_to do |format|
          if @post.save
            format.html { redirect_to post_url(@post), notice: "Post was successfully created." }

          else
            format.html { render :new, status: :unprocessable_entity }
            
          end
        end
      end 

    def update
        respond_to do |format|
            @post = Post.find(params[:id]) 
            if @post.update(post_params)
                format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
                
            else
                format.html { render :edit, status: :unprocessable_entity }
            
            end
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    
        respond_to do |format|
          format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
        end
    end

      private
  
      def post_params
        params.require(:post).permit(:titulo, :sigla_ramo, :precio, :descripcion, :user_id) ###obsssss
      end
end
  