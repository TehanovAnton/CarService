# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @client = Client.find_by(id: params[:client_id])
    @orders = @client.orders
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
    @mechanics_fot_options = @mechanics.map { |mechanic| [mechanic.full_name, mechanic.id] }.to_h
    @services_for_options = Service.all.map { |service| [service.title, service.id] }.to_h

    @description = Faker::Coffee.blend_name
    @mechanic = @mechanics.sample
    @service = @mechanic.services.first
  end

  def create
    @order = Order.new(order_params)

    if @order.valid?
      @order.save
      redirect_to actual_orders_path, notice: 'new order added'
    else
      redirect_to new_client_order_path(@order.client), flash: { errors: @order.errors.map(&:message) }
    end
  end

  def edit
    @client = Client.find_by(id: params[:client_id])
    @order = Order.find_by(id: params[:id])
    @mechanics = Mechanic.all
    @mechanic_fot_options = @mechanics.map { |mechanic| [mechanic.full_name, mechanic.id] }.to_h

    @services = Service.all
    @services_for_options = @services.map { |service| [service.title, service.id] }.to_h
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
      if Order.new(order_params).valid?
        @order.update(order_params)
        redirect_to actual_orders_path, notice: 'order updated' unless current_user.is_a? Admin
      else
        redirect_to edit_client_order_path(client_id: params[:client_id], id: @order.id), notice: 'this mechanic can\'t do this service' unless current_user.is_a? Admin
      end
    end

    redirect_to client_path(current_user), notice: 'order state updated' if current_user.is_a? Admin
  end

  def destroy
    @user = User.find_by(id: params[:user_id])

    Order.find_by(id: params[:id]).destroy

    redirect_to actual_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:description, :client_id, :mechanic_id, service_order_attributes: :service_id)
  end
end
