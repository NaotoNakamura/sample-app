FactoryBot.define do
  factory :post do
    body { Faker::Lorem.characters(number: 100) }
    user
  end
end
