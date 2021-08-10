class ServiceOrdersController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @service_orders = @user.service_orders
  end

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @user.service_orders.create(service_orders_params)
    redirect_to user_service_orders_path(@user)
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @order = ServiceOrder.find_by(id: params[:id])
  end

  def update
    @order = ServiceOrder.find_by(id: params[:id])
    # puts "STATE #{@order.state} ..."

    if params[:state]
      case @order.state
      when 'accepted'
        @order.progress!
        puts "################# #{@order.state} : #{@order.in_progress?} ..."
      when 'in_progress'
        @order.finish!
      end
    else
      @order.update(service_orders_params) unless params[:state]
    end

    redirect_to user_service_orders_path(user_id: @order.user_id)
  end

  def destroy
    @user = User.find_by(id: params[:user_id])

    puts "params_id: #{params[:user_id]}"

    ServiceOrder.find_by(id: params[:id]).destroy
    redirect_to user_service_orders_path(@user)
  end

  private

  def service_orders_params
    params.require(:service_order).permit(:description)
  end
end
