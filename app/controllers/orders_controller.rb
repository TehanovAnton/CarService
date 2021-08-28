class OrdersController < ApplicationController

  def index
    @user = User.find_by(id: params[:user_id])
    @orders = @user.orders
  end

  def show_actual_orders
    @orders = current_user.orders
    redirect_to clients_path, notice: 'You have no orders yet' if @orders.empty?
  end

  def show_services
    @services = Service.all
  end

  def new
    @client = Client.find_by(id: params[:client_id])
    @service_id = params[:service_id].to_i
    @mechanics = Mechanic.all
    @order = @client.orders.build
    @mechanics_for_options = Mechanic.all.map do |m|
      ["#{m.first_name} #{m.last_name}", m.id]
    end

    @services_for_options = Service.all.map do |s|
      [s.title, s.id]
    end

    logger.info("!!!service_id: #{@service_id}; is_i?: #{@service_id.is_a? Integer}")
  end

  def create
    @client = Client.find_by(id: params[:client_id])
    @order = Order.new(order_params)
    
    if @order.valid?
      @order.save
      redirect_to actual_orders_path, notice: 'new order added'
    else
      binding.pry
      redirect_to new_client_order_path(@client), error: @order.error_messages
    end

  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @order = Order.find_by(id: params[:id])
    @mechanics = Mechanic.all
    @services = Service.all
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
    elsif @order.state == 'in_review'
      @order.update(order_params)

      @order.services.destroy_all

      params[:services].map(&:to_i).each do |id|
        ServiceOrder.create(order_id: @order.id, service_id: id)
      end
    end

    redirect_to actual_orders_path, notice: 'order updated' unless current_user.is_a? Admin
    redirect_to client_path(current_user), notice: 'order state updated' if current_user.is_a? Admin
  end

  def destroy
    @user = User.find_by(id: params[:user_id])

    puts "params_id: #{params[:user_id]}"

    Order.find_by(id: params[:id]).destroy
    redirect_to user_orders_path(@user)
  end

  private

  def order_params
    params.require(:order).permit(:description, :client_id, :mechanic_id, service_orders_attributes: [:service_id])
  end

  def is_there_mechanic?
    mechanics = Mechanic.all.map do |m|
      m.services.map(&:id)
    end    

    services_ids = params[:services].map(&:to_i)

    mechanics.map { |m|
      services_ids & m  == services_ids
    }.include? true
  end

  def find_order_mechanic_id(services_ids)
    services_ids.map!(&:to_i)

    mech = Mechanic.all.select { |m|
      services_ids & m.services.map(&:id) == services_ids
    }.first

    mech.id
  end
end
