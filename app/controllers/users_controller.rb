class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = current_user
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end
end
