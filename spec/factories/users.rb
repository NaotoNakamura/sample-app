FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 5) }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { Faker::Lorem.characters(number: 10) }
  end
end
