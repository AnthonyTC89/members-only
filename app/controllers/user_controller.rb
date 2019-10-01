# frozen_string_literal: true

class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      remember_cookies @user
      flash.now[:info] = "Account successfully created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private 

    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                  :password_confirmation)
    end
end
