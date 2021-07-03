class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # проверить id
    exists_id = User.all.map { |el| el.id }.include? params[:id].to_i

    if exists_id
      @user = User.find(params[:id])
    else
      redirect_to user_index_path
    end
  end

  def me
    redirect_to new_user_session_path if current_user.nil?
    @me = current_user
  end

  def destroy
    @user = User.find(params[:id])      
    reset_session if @user == current_user
    @user.destroy
    redirect_to user_index_path
  end
end
