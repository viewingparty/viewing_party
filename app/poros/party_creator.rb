class PartyCreator

  def initialize(data, user, movie)
    @party = data[:party]
    @user = user
    @movie = movie
  end

  def make_the_party
    party = Party.create(time: @party[:time], duration: @party[:duration], user: @user, movie: @movie)
    @party[:guests].each do |guest|
      if guest != ""
        friend = User.find(guest) 
        Guest.create(user: friend, party: party)
      end
    end
  end
end