class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum status: %I[pending accepted rejected]

  def self.befriended
      where(status: 1)
  end
end
