require 'rails_helper'

describe PartyCreator do
  it 'can make a party without guests' do
    data = {time: DateTime.current.strftime("%m%e%Y\t%l%M%p"), duration: 200, guests: nil}
    user = User.create(email: "admin@example.com", password: "password")
    movie = Movie.create(title: "Mad Max", duration: 120, api_id: 12345)

    party_creator = PartyCreator.new(data, user, movie)
    party_creator.make_the_party
    expect(party_creator.user).to eq(user)
    expect(party_creator.guests).to be(nil)
    expect(Party.all.last.user).to eq(user)
  end

  it 'can make a party with guests' do
    user1 = User.create(email: "bob@example.com", password: "password")
    user2 = User.create(email: "bill@example.com", password: "password")

    data = {time: DateTime.current.strftime("%m%e%Y\t%l%M%p"), duration: 200, guests: ["#{user1.id}", "#{user2.id}"]}
    user = User.create(email: "admin@example.com", password: "password")
    movie = Movie.create(title: "Mad Max", duration: 120, api_id: 12345)

    party_creator = PartyCreator.new(data, user, movie)
    party_creator.make_the_party
    expect(party_creator.user).to eq(user)
    expect(party_creator.guests).to eq(["#{user1.id}", "#{user2.id}"])
    expect(Party.all.last.user).to eq(user)
  end
end