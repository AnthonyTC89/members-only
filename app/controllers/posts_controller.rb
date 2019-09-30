class PostsController < ApplicationController
  before_action :require_login

  def new
  end

  def create 
  end

  def index 
  end

  private 

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to make/edit posts"
      redirect_to login_path
    end
  end
end
