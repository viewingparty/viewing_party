class Movie < ApplicationRecord
  validates :title, presence: :title
  validates :duration, presence: :duration
  validates :api_id, presence: :api_id
  has_many :parties
end
