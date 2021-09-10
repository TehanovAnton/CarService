# frozen_string_literal: true

FactoryBot.define do
  factory :mechanic_service do
    association :mechanic
    association :service
  end
end
