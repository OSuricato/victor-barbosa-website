class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @recent_posts = Post.order(created_at: :desc).limit(3)
  end

  def about
  end
end
