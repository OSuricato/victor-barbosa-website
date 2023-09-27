class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :blog, :portfolio]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def blog
    @pagy, @posts = pagy(Post.joins(:post_category).where(post_categories: { name: 'Blog' }))
  end

  def portfolio
    @pagy, @posts = pagy(Post.joins(:post_category).where(post_categories: { name: 'Portfolio' }))
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user  # assign the current user to the post
    authorize @post

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      respond_to do |format|
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :link, :post_category_id, { tag_ids: [] }, photos: [])
  end


  def check_user
    unless current_user && current_user.email == 'victor@victorbarbosa.com'
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
