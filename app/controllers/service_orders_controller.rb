class ServiceOrdersController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @user.service_orders.create(service_orders_params)

    redirect_to user_service_orders(@user)
  end

  private

  def service_orders_params
    params.require(:service_order).permit(:description)
  end
end
