class PostsController < ApplicationController
  before_action :require_login, only:[:new, :create]

  def new
  end

  def create 
    @post = Post.new(post_params)
    @post.save
    redirect_to '/posts'
  end

  def index 
    @posts = Post.all
  end

  private 

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to make/edit posts"
      redirect_to login_path
    end
  end
end
