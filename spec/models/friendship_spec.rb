require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :friend}
  end

  describe 'class methods' do
  end
end