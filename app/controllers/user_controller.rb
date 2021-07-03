class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # проверить id
    @user = User.find(params[:id])
  end

  def me
    @me = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy


    redirect_to user_index_path
  end
end
