class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum status: %I[pending accepted rejected]

  def self.befriended
      where(status: 1)
  end

  def self.friends(user_id)
    fs = where(user_id: user_id).or(where(friend_id: user_id))
  end
end
