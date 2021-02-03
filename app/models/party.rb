class Party < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :guests
end
