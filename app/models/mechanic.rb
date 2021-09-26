# frozen_string_literal: true

class Mechanic < User
  has_many :orders
  has_many :clients, through: :orders

  has_many :mechanic_services, dependent: :destroy
  has_many :services, through: :mechanic_services

  accepts_nested_attributes_for :mechanic_services

  validate :mechanic_services_cannot_be_blank?

  protected

  def mechanic_services_cannot_be_blank?
    errors.add(:mechanic_services, I18n.t('flashes.cannot_be_blank')) if mechanic_services.empty?
  end

  def confirmation_required?
    false
  end
end
