# frozen_string_literal: true

class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    redirect_to user_index_path unless @user
  end

  def me
    redirect_to new_user_session_path unless current_user
    @me = current_user
  end

  def edit
    redirect_to new_user_session_path unless current_user
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to me_path
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end

  def destroy
    # @user = User.find_by(params[:id])
    @user = User.find(params[:id])
    if @user
      reset_session if @user == current_user
      @user.destroy
    end
    redirect_to user_index_path
  end
end
