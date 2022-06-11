class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  def set_data
    @post =  Post.new
  end
  def preload_test
    Post.preload(:user)
  end
  private
    def aisatsu
      ["aaa", "bbb"]
    end

    def messi
      sample = []
      @evaluation_log_ids.each do |evaluation_log_id|
        sample << evaluation_log_id
      end
    end

end
