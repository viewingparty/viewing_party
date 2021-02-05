class PartyCreator
  attr_reader :user,
              :movie,
              :time,
              :duration,
              :guests
  
  def initialize(data, user, movie)
    @duration = data[:duration]
    @time = data[:time]
    @guests = data[:guests]
    @user = user
    @movie = movie
  end

  def make_the_party
    party = Party.create(time: @time, duration: @duration, user: @user, movie: @movie)
    if @guests != nil
      @guests.each do |guest|
        friend = User.find(guest)
        Guest.create(user: friend, party: party)
      end
    end
  end
end
