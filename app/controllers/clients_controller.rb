# frozen_string_literal: true

class ClientsController < ApplicationController
  def guest; end

  def index
    @teammates = Teammate.all
  end

  def me
    @me = current_user
  end

  def show
    @clients_all = Client.all
  end

  def edit
    @client = client_find_by_id(params[:id])
  end

  def update
    @client = client_find_by_id(:id)
    @client.update(client_params)
    redirect_to client_path, notice: 'updated successfully'
  end

  private

  def client_params
    params.require(@client.is_a?(Admin) ? :admin : :client).permit(:first_name, :last_name, :email, :phone_number)
  end
end
