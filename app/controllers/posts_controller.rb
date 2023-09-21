class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def blog
    @posts = Post.joins(:post_category).where(post_categories: { name: 'Blog' })
  end

  def portfolio
    @posts = Post.joins(:post_category).where(post_categories: { name: 'Portfolio' })
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :category, :link)
  end

  def check_user
    unless current_user && current_user.email == 'victor@victorbarbosa.com'
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
