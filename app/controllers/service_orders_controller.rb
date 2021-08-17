class ServiceOrdersController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @service_orders = @user.service_orders
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @mechanics = Mechanic.all
  end

  def show_actual_orders
    @orders = current_user.service_orders
    redirect_to users_path, notice: 'You have no orders yet' if @orders.empty?
  end

  def create    
    current_user.service_orders.create(service_orders_params)
    redirect_to users_path, notice: 'new order added'
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @order = ServiceOrder.find_by(id: params[:id])
  end

  def update
    @order = ServiceOrder.find_by(id: params[:id])

    if params[:state]
      case @order.state
      when 'accepted'
        @order.progress!
      when 'in_progress'
        @order.finish!
      end
    else
      @order.update(service_orders_params) unless params[:state]
    end

    redirect_to users_path
  end

  def destroy
    @user = User.find_by(id: params[:user_id])

    puts "params_id: #{params[:user_id]}"

    ServiceOrder.find_by(id: params[:id]).destroy
    redirect_to user_service_orders_path(@user)
  end

  private

  def service_orders_params
    params.require(:service_order).permit(:description, :mechanic_id)
  end
end
