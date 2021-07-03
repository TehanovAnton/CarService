# frozen_string_literal: true

class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(params[:id])
    redirect_to user_index_path unless @user
  end

  def me
    redirect_to new_user_session_path unless current_user
    @me = current_user
  end

  def destroy
    @user = User.find_by(params[:id])
    if @user
      reset_session if @user == current_user
      @user.destroy
    end
    redirect_to user_index_path
  end
end
