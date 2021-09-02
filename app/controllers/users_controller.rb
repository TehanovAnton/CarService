# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :requier_login, only: [:guest]

  def guest; end

  def show_mechanics
    @mechanics = Mechanic.all
  end

  def show_teammates
    @teammates = Teammate.all
    binding.pry
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to client_path, notice: 'updated successfully'
  end

  def destroy
    @user = user_find_by_id(:id)
    if current?(@user) || admin?(current_user)
      reset_session if current?(@user)
      @user.destroy
    end

    redirect_to users_path
  end

  private

  def user_params
    params.require(@user.is_a?(Admin) ? :admin : :user).permit(:first_name, :last_name, :email, :phone_number)
  end

  def current?(user)
    user == current_user
  end

  def admin?(user)
    user.is_a Admin
  end
end
