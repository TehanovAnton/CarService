class ServiceOrder < ApplicationRecord
  belongs_to :user

  validates :state, inclusion: { in: %w[accepted in_progress done]}
end
