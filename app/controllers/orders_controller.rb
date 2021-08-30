# frozen_string_literal: true

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
    @order = @client.orders.build
    @mechanics = Mechanic.all
    @services = Service.all

    @description = Faker::Coffee.blend_name
    @mechanic = @mechanics[Faker::Number.between(from: 0, to: @mechanics.count - 1)]
    @service = @mechanic.services.first
  end

  def create
    @client = Client.find_by(id: params[:client_id])

    if is_there_mechanic?
      @order = @client.orders.create(orders_params)

      params[:services].map(&:to_i).each do |id|
        ServiceOrder.create(order_id: @order.id, service_id: id)
      end

      redirect_to actual_orders_path, notice: 'new order added'
    else
      redirect_to new_client_order_path(@client), notice: 'no mechanic for that order'
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
      @order.update(orders_params)
    end

    redirect_to actual_orders_path, notice: 'order updated'
  end

  def destroy
    @user = User.find_by(id: params[:user_id])

    puts "params_id: #{params[:user_id]}"

    Order.find_by(id: params[:id]).destroy
    redirect_to user_orders_path(@user)
  end

  private

  def orders_params
    p = params.require(:order).permit(:description, :client_id)
    p[:client_id] = params[:client_id]
    p[:mechanic_id] = find_order_mechanic_id(params[:services])
    p
  end

  def is_there_mechanic?
    mechanics = Mechanic.all.map do |m|
      m.services.map(&:id)
    end

    services_ids = params[:services].map(&:to_i)

    mechanics.map do |m|
      services_ids & m == services_ids
    end.include? true
  end

  def find_order_mechanic_id(services_ids)
    services_ids.map!(&:to_i)

    mech = Mechanic.all.select do |m|
      services_ids & m.services.map(&:id) == services_ids
    end.first

    mech.id
  end
end
