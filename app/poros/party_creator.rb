class PartyCreator
  attr_reader :user,
              :movie,
              :time,
              :duration,
              :guests,
              :data
  
  def initialize(data, user, movie)
    @data = data
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
        if guest != ""
          friend = User.find(guest.to_i)
          Guest.create(user: friend, party: party)
        end
      end
    end
  end
end
