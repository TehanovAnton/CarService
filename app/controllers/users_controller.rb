# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    @orders = current_user.service_orders
  end

  def show
    @users_all = User.all
  end

  def me
    @me = current_user
  end

  def edit
    @user = user_find_by_id(:id)
  end

  def update
    @user = user_find_by_id(:id)
    @user.update(user_params)
    redirect_to root_path, notice: 'updated successfully'
  end

  def destroy
    @user = user_find_by_id(:id)
    if current?(@user) || admin?(current_user)
      reset_session if current?(@user)
      @user.destroy
    end

    redirect_to users_path
  end

  def no_orders
    redirect_to root_path, notice: 'You have no orders yet'
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
    user.is_a Admin
  end
end
