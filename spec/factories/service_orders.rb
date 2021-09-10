# frozen_string_literal: true

FactoryBot.define do
  factory :service_order do
    association :order
    association :service
  end
end
