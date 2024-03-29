class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { maximum: 255 }
  default_scope -> { order(created_at: :desc) }
  has_one_attached :picture
end
