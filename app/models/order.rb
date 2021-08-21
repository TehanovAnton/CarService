class Order < ApplicationRecord
  include AASM

  aasm column: 'state', whiny_transitions: false do
    state :accepted, initial: true
    state :in_progress, :done

    event :progress do
      transitions from: :accepted, to: :in_progress
    end

    event :finish do
      transitions from: :in_progress, to: :done
    end
  end

  belongs_to :user
  belongs_to :service
  belongs_to :mechanic


  validates :state, inclusion: { in: %w[accepted in_progress done] }

  def done?
    state == 'done'
  end
end
