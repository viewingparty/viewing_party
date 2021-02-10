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
    it 'can differentiate between friends and pending friends' do
      user = User.create(email: "admin@example.com", password: "password")
      user2 = User.create(email: "billy@bob.com", password: "password")
      user3 = User.create(email: "nope@gmail.com", password: "password")
      invite = Friendship.create(user: user, friend: user2)

      expect(user.friends).to eq([])
      expect(user.friend_invites).to eq([])

      expect(user2.friends).to eq([])
      expect(user2.friend_invites).to eq([invite])

      invite.update(status: 1)

      expect(user.friends).to eq([user2])
      expect(user2.friends).to eq([user])
      expect(user2.friend_invites).to eq([])
      expect(user.friend_invites).to eq([])

      invite2 = Friendship.create(user: user, friend: user3)

      expect(user.friends).to eq([user2])
      expect(user.friend_invites).to eq([])

      expect(user3.friends).to eq([])
      expect(user3.friend_invites).to eq([invite2])
    end

    it 'can have pending friends' do
      user = User.create(email: "admin@example.com", password: "password")
      user2 = User.create(email: "billy@bob.com", password: "password")
      user3 = User.create(email: "nope@gmail.com", password: "password")
      invite = Friendship.create(user: user, friend: user2)

      expect(user.pending_friends).to eq([invite])
    end
  end
end