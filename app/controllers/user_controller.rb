# frozen_string_literal: true

class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by id: params[:id]
    redirect_to user_index_path unless @user
  end

  def me
    redirect_to new_user_session_path unless current_user
    @me = current_user
  end

  def edit
    @user = User.find_by(id: params[:id])
    unless current_user
      redirect_to new_user_session_path
    else
      redirect_to user_index_path unless @user == current_user || current_user.is_a?(Admin)
    end
  end

  def update
    @user = User.find_by id: params[:id]
    if current_user.is_a?(Admin) || @user == current_user
      @user.update(user_params)
      redirect_to @user == current_user ? me_path : user_path(@user)
    else
      render :edit
    end
  end

  def user_params
    params.require(@user.is_a?(Admin) ? :admin : :user).permit(:first_name, :last_name, :email, :phone_number)
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user == current_user || current_user.is_a?(Admin)
      reset_session if @user == current_user
      @user.destroy
    end

    redirect_to user_index_path
  end
end
