class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :email
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :parties
  has_many :guests, through: :parties
  
end
