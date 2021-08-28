class Order < ApplicationRecord
  include AASM
  aasm column: 'state', whiny_transitions: false do
    state :in_review, initial: true
    state :in_progress, :done

    event :progress do
      transitions from: :in_review, to: :in_progress
    end

    event :finish do
      transitions from: :in_progress, to: :done
    end
  end

  belongs_to :client
  belongs_to :mechanic

  has_many :service_orders, dependent: :destroy
  has_many :services, through: :service_orders

  accepts_nested_attributes_for :service_orders

  validates :state, inclusion: { in: %w[in_review in_progress done] }
  validate :valid_mechanic?

  def valid_mechanic?
    mechanic_services = mechanic.services

    binding.pry
    errors.add(:services, 'One of the services is not supported by mechanic') unless service_orders.map(&:service).all? do |service|
      mechanic_services.include? service
    end
  end

  def done?
    state == 'done'
  end
end
