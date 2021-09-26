# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :service_orders
  has_many :orders, through: :service_orders

  has_many :mechanic_services, dependent: :destroy
  has_many :mechanics, through: :mechanic_services

  validate :valid_price?
  validate :title_cannot_be_blank?
  validate :price_cant_be_zero?

  monetize :price_cents

  def valid_price?
    errors.add(:services, I18n.t('flashes.price_cant_be_negative_or_0')) if price <= 0
  end

  def title_cannot_be_blank?
    errors.add(:title, I18n.t('flashes.cannot_be_blank')) if title.empty?
  end

  def price_cant_be_zero?
    errors.add(:title, I18n.t('flashes.should_not_be_zero')) if price.zero?
  end
end
