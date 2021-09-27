# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :requier_login, only: [:guest]

  def guest; end

  def show_mechanics
    @mechanics = Mechanic.all
  end

  def show_teammates
    @teammates = Teammate.all
  end

  def edit
    @user = find_user(params[:id])
  end

  def update
    @user = find_user(params[:id])
    @user.update(user_params)
    puts "new obj: #{@user.first_name} #{@user.last_name} #{@user.phone_number} #{@user.email}"
    redirect_to me_path, notice: 'updated successfully'
  end

  def destroy
    @user = find_user(params[:id])
    if current?(@user) || admin?(current_user)
      reset_session if current?(@user)
      @user.destroy
    end

    redirect_to root_path
  end

  private

  def user_params
    required_key = @user.is_a?(Admin) ? :admin : :client
    params.require(required_key).permit(:first_name, :last_name, :email, :phone_number)
  end

  def current?(user)
    user == current_user
  end

  def admin?(user)
    user.is_a Admin
  end
end
