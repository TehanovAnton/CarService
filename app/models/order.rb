# frozen_string_literal: true

class Order < ApplicationRecord
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

  validate :valid_mechanic?

  def valid_mechanic?
    errors.add(:services, 'One of the services is not supported by mechanic') unless mechanic.services.include?(service_order.service)
  end

  def done?
    state == 'done'
  end
end
