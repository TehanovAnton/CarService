class OrdersController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @orders = @user.orders
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @mechanics = Mechanic.all
    @services = Service.all
    @service_id = params[:service_id].to_i
    logger.info("!!!service_id: #{@service_id}; is_i?: #{@service_id.is_a? Integer}")
  end

  def show_actual_orders
    @orders = current_user.orders
    redirect_to users_path, notice: 'You have no orders yet' if @orders.empty?
  end

  def show_services
    @services = Service.all
  end

  def create
    current_user.orders.create(orders_params)
    redirect_to actual_orders_path, notice: 'new order added'
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @order = Order.find_by(id: params[:id])
  end

  def update
    @order = Order.find_by(id: params[:id])

    if params[:state]
      case @order.state
      when 'in_review'
        @order.progress!
      when 'in_progress'
        @order.finish!
      end
    else
      @order.update(orders_params) unless params[:state]
    end

    redirect_to users_path
  end

  def destroy
    @user = User.find_by(id: params[:user_id])

    puts "params_id: #{params[:user_id]}"

    Order.find_by(id: params[:id]).destroy
    redirect_to user_orders_path(@user)
  end

  private

  def orders_params
    p = params.require(:order).permit(:description, :mechanic_id, :service_id, :user_id)
    p[:user_id] = params[:user_id]
    p
  end
end
