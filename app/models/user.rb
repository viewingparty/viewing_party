class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: :email

  has_many :friendships, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :parties, dependent: :destroy

  def friend_invites
    Friendship.where(friend: self, status: :pending)
  end

  def friends
    approved_friendships = (friendships.where(status: 1) + Friendship.where(friend: self).where(status: 1))
    approved_friendships.map do |friendship|
      friendship.user_id == self.id ? friendship.friend : friendship.user
    end
  end
end
