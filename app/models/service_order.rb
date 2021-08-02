class ServiceOrder < ApplicationRecord
  include AASM

  aasm do
  end
  belongs_to :user

  validates :state, inclusion: { in: %w[accepted in_progress done] }

  def done?
    state == 'done'
  end

  def update_state
    state == 'accepted' ? update(state: 'in_progress') : update(state: 'done')
  end
end
