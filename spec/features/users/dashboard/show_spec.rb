require 'rails_helper'

describe 'as an authenticated user' do
  describe 'when I visit my dashboard' do
    before :each do
      @user = User.create(email: "admin@example.com", password: "password")
      @user2 = User.create(email: "billy@bob.com", password: "password")
      @invite = Friendship.create(user: @user, friend: @user2)
      @movie = Movie.create(api_id: 50, duration: "120", title: "bobs funeral")
      @movie2 = Movie.create(api_id: 50, duration: "120", title: "billies funeral")

      @party = @user.parties.create(user: @user, movie: @movie, time: DateTime.current.strftime("%m%e%Y\t%l%M%p"))
      @party2 = @user.parties.create(user: @user, movie: @movie2, time: DateTime.current.strftime("%m%e%Y\t%l%M%p"))

      end

    it 'can have a navbar' do
      login_as(@user)
      visit user_dashboard_path(@user)

      expect(page).to have_button("Discover Movies")
    end

    it 'has friends and parties' do
      login_as(@user)
      visit user_dashboard_path(@user)
      within(".my_parties") do
        expect(page).to have_content(@party.movie.title)
        expect(page).to have_content(@party2.movie.title)
      end
      within(".friends") do
        expect(page).to have_content(@user2.email)
      end
    end

    it 'can accept friends' do
      login_as(@user2)
      visit user_dashboard_path(@user2)

      within(".friends") do
        expect(page).to have_content("You currently have no friends.")
        expect(page).to_not have_content(@user.email)
      end
      within("#invite-#{@invite.id}") do
        expect(page).to have_content(@user.email)
        click_on "Accept"
      end
      
      within(".friends") do
        expect(page).to have_content(@user.email)
      end
    end

    it 'can reject friends' do
      login_as(@user2)
      visit user_dashboard_path(@user2)

      within("#invite-#{@invite.id}") do
        click_on "Reject"
      end

      expect(@user2.friends.count).to eq(0)
    end
  end
end
