10.times do |n|
  User.create!(
    email: "test#{n + 1}@example.com",
    name: "テストユーザー#{n + 1}",
    password: "password"
  )
end