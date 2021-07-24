# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = user_find_by_id(:id)
    redirect_to users_path unless @user
  end

  def me
    redirect_to new_user_session_path unless current_user
    @me = current_user
  end

  def edit
    @user = user_find_by_id(:id)
    redirect_to users_path unless current?(@user) || admin?(current_user)
  end

  def update
    @user = user_find_by_id(:id)
    @user.update(user_params)
    redirect_to current?(@user) ? me_path : user_path(@user)
  end

  def destroy
    @user = user_find_by_id(:id)
    if current?(@user) || admin?(current_user)
      reset_session if current?(@user)
      @user.destroy
    end

    redirect_to users_path
  end

  def eaxmple
  end

  private

  def user_params
    params.require(@user.is_a?(Admin) ? :admin : :user).permit(:first_name, :last_name, :email, :phone_number)
  end

  def user_find_by_id(id)
    User.find_by id: params[id]
  end

  def current?(user)
    user == current_user
  end

  def admin?(user)
    user.type == 'Admin'
  end
end
