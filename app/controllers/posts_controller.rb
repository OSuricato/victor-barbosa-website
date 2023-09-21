class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    # GET /posts
    # GET /posts.json
    def index
      if params[:category]
        @posts = Post.where(category: params[:category])
      else
        @posts = Post.all
      end
    end

    # Other controller actions...

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :content, :category)
      end
end
