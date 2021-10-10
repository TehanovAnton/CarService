# frozen_string_literal: true

require 'elasticsearch/model'

class Order < ApplicationRecord
  include Elasticsearch::Model

  include AASM
  aasm column: 'state', whiny_transitions: false do
    state :in_review, initial: true
    state :in_progress, :done

    event :progress do
      transitions from: :in_review, to: :in_progress, guard: :valid?
    end

    event :finish, guards: [:valid?] do
      transitions from: :in_progress, to: :done, guard: :valid?
    end
  end

  belongs_to :client
  belongs_to :mechanic

  has_one :service_order, dependent: :destroy
  has_one :service, through: :service_order

  accepts_nested_attributes_for :service_order, allow_destroy: true

  validates :state, inclusion: { in: %w[in_review in_progress done] }
  validate :description_cant_be_blank?

  validate :mechanic_can_do_service?

  def mechanic_can_do_service?
    errors.add(:services, I18n.t('flashes.One_of_the_services_is_not_supported_by_mechanic')) unless mechanic.services.include?(service_order.service)
  end

  def description_cant_be_blank?
    errors.add(:order, I18n.t('flashes.Blank_description')) if description.empty?
  end

  def done?
    state == 'done'
  end
end

Order.__elasticsearch__.create_index!
Order.import
