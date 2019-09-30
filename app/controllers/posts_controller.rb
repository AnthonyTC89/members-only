# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]

  def new; end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
      redirect_to '/posts'
    else
      flash.now[:danger] = "Title/content can't be empty"
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def require_login
    return if logged_in?
    
    flash[:error] = "You must be logged in to make/edit posts"
    redirect_to login_path
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
