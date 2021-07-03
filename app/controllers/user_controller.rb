class UserController < ApplicationController

  def exists_id id
    User.all.map { |el| el.id }.include? params[id].to_i
  end

  def index
    @users = User.all
  end

  def show
    if exists_id :id
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
    if exists_id :id
      @user = User.find(params[:id])
      reset_session if @user == current_user
      @user.destroy
    end
    redirect_to user_index_path
  end
end
