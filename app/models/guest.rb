class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_one :movie, through: :party
end
