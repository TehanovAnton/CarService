# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    description { Faker::Coffee.blend_name }
    association :client
    association :mechanic
    service_order_attributes { attributes_for(:service_order, service_id: mechanic.services.first.id) }

    trait :rubber_replacement do
      service_id { create(:mechanic, :rubber_replacement).services.first.id }
    end
  end
end
