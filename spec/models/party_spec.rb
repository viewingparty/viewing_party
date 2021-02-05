require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :movie}
    it {should have_many :guests}
  end

  describe 'instance methods' do
  end
end