# frozen_string_literal: true

FactoryBot.define do
  client = Client.find_by(email: 'tehanovanton@gmail.com')
  mechanic = Mechanic.first

  factory :order do
    description { Faker::Coffee.blend_name }
    client_id { client ? client.id : create(:client, :tehanov_anton_email).id }
    mechanic_id { mechanic ? mechanic.id : create(:mechanic).id }
    service_order_attributes { attributes_for(:service_order, service_id: Mechanic.find_by(id: mechanic_id).services.first.id) }

    trait :rubber_replacement do
      service_id { create(:mechanic, :rubber_replacement).services.first.id }
    end
  end
end
