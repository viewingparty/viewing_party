class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum status: %I[pending accepted rejected]

  def self.befriended
      where(status: 1)
  end

  def self.friends(user_id)
    fs = where(user_id: user_id).or(where(friend_id: user_id)).where(status: 1)
    a = fs.pluck(:friend_id) + fs.pluck(:user_id)
    a = a.select do |element|
      element != user_id
    end
    b = []  
    a.each do |user|
      b << User.find(user)
    end
    b
  end
end
