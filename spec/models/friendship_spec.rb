require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :friend}
  end

  describe 'instance methods' do
    it 'can find friends and approved friends' do
      # for more rigourous testing see "/models/user_spec.rb"
      user = User.create(email: "admin@example.com", password: "password")
      user2 = User.create(email: "billy@bob.com", password: "password")
      user3 = User.create(email: "nope@gmail.com", password: "password")
      invite = Friendship.create(user: user, friend: user2)

      expect(Friendship.friends(user.id)).to eq([])

      invite.update!(status: 1)

      expect(Friendship.friends(user.id)).to eq([user2])
      expect(Friendship.friends(user2.id)).to eq([user])
    end
  end
end