class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    is_matching_login_user
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    user_id = params[:id]
    login_user_id = current_user.id
    if @user ==  current_user
    else
      redirect_to user_path(current_user.id)
    end
  end
end
