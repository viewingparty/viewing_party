class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :column, :email
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties, dependent: :destroy
  has_many :guests, through: :parties
end
