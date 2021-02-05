class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: :email
  
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :guests
  has_many :parties, dependent: :destroy

  def friend_invites
    Friendship.where(friend: self, status: :pending)
  end

  def has_no_friends?
    friends.count == 0
  end

  def my_parties
    parties.where(user_id: self.id)
  end
end
