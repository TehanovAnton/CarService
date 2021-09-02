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
    params.require(@client.is_a?(Admin) ? :admin : :client).permit(:first_name, :last_name, :email, :phone_number)
  end
end
