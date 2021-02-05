require 'rails_helper'

describe 'as an authenticated user' do
  describe 'when I visit my dashboard' do
    before :each do
      @user = User.create(email: "admin@example.com", password: "password")
      @movie = Movie.create(api_id: 50, duration: "120", title: "bobs funeral")
      @movie2 = Movie.create(api_id: 50, duration: "120", title: "billies funeral")

      @party = @user.parties.create(user: @user, movie: @movie, time: DateTime.current.strftime("%m%e%Y\t%l%M%p"))
      @party2 = @user.parties.create(user: @user, movie: @movie2, time: DateTime.current.strftime("%m%e%Y\t%l%M%p"))

      @user

      login_as(@user)
    end

    it 'can have a navbar' do
      visit user_dashboard_path(@user)

      expect(page).to have_button("Discover Movies")
    end

    it 'has friends and parties' do
      visit user_dashboard_path(@user)
      within(".parties") do
        expect(page).to have_content(@party.movie.title)
        expect(page).to have_content(@party2.movie.title)
        
      end
    end
  end
end
