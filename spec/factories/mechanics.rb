FactoryBot.define do
  factory :mechanic do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.free_email }
    password { 'ewqqwe' }
    mechanic_services_attributes { [attributes_for(:mechanic_service, service_id: service_id)] }

    transient do
      service_id { create(:service).id }
    end

    trait :rubber_replacement do
      service_id { create(:service, :rubber_replacement).id }
    end
  end
end
