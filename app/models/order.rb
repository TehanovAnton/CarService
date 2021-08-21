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

  belongs_to :user
  belongs_to :service
  belongs_to :mechanic


  validates :state, inclusion: { in: %w[in_review in_progress done] }

  def done?
    state == 'done'
  end
end
