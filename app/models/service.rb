# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :service_orders
  has_many :orders, through: :service_orders

  has_many :mechanic_services, dependent: :destroy
  has_many :mechanics, through: :mechanic_services

  validate :valid_price?
  validates :title, exclusion: { in: [''], message: 'should not be blank' }
  validates :price, exclusion: { in: [0], message: 'should not be zero' }

  monetize :price_cents

  def valid_price?
    errors.add(:services, I18n.t('flashes.price_cant_be_negative_or_0')) if price <= 0
  end
end
