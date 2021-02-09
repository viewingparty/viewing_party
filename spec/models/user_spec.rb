require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email}
  end

  describe 'relationships' do
    it {should have_many :friendships}
    it {should have_many :parties}
    it {should have_many(:guests)}
  end

  describe 'instance methods' do
  end
end