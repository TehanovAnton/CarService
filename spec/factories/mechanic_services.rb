FactoryBot.define do
  factory :mechanic_service do
    association :mechanic
    association  :service
  end
end
