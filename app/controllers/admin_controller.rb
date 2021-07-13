class AdminController < ApplicationController
  def index
    if current_user&.instance_of?(Admin)
      redirect_to me_path
    else
      redirect_to user_index_path
    end
  end

  def edit
    redirect_to new_user_session_path unless current_user&.instance_of?(Admin)
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to user_index_path
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end
