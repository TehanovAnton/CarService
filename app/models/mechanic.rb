# frozen_string_literal: true

class Mechanic < User
  has_many :orders
  has_many :clients, through: :orders

  has_many :mechanic_services, dependent: :destroy
  has_many :services, through: :mechanic_services

  protected

  def confirmation_required?
    false
  end
end
