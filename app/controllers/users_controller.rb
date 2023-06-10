class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end
end
