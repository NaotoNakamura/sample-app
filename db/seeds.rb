10.times do |n|
  User.create!(
    email: "test#{n + 1}@example.com",
    name: "テストユーザー#{n + 1}",
    password: "password"
  )
  Post.create!(
    user_id: n + 1,
    body: "これは#{n + 1}つめの投稿です。",
  )
end
Relationship.create!(
  follower_id: 1,
  followed_id: 2,
)
Relationship.create!(
  follower_id: 2,
  followed_id: 1,
)
Relationship.create!(
  follower_id: 1,
  followed_id: 3,
)