class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum status: %I[pending accepted rejected]

  def self.friends(id)
    self.approved_friendships(id).map do |friendship|
      friendship.user_id == id ? friendship.friend : friendship.user
    end
  end

  def self.approved_friendships(id)
    where("friendships.status = 1 AND (friendships.user_id = ? OR friendships.friend_id = ?)", id, id)
  end
end
