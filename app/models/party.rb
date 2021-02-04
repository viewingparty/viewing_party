class Party < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :guest, dependent: :destroy
end