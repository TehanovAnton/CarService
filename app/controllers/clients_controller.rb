# frozen_string_literal: true

class ClientsController < ApplicationController
  def me
    @me = current_user
  end

  def show
    @clients_all = Client.all
  end

  private

  def client_params
    required_key = @client.is_a?(Admin) ? :admin : :client
    params.require(required_key).permit(:first_name, :last_name, :email, :phone_number)
  end
end
