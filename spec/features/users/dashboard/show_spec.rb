require 'rails_helper'

describe 'as an authenticated user' do
  describe 'when I visit my dashboard' do
    before :each do
      @user = User.create(email: "admin@example.com", password: "password")
      @user2 = User.create(email: "billy@bob.com", password: "password")
      @user3 = User.create(email: "nope@gmail.com", password: "password")
      @invite = Friendship.create(user: @user, friend: @user2)
      @movie = Movie.create(api_id: 50, duration: "120", title: "bobs funeral")
      @movie2 = Movie.create(api_id: 50, duration: "120", title: "billies funeral")

      @party = @user.parties.create(user: @user, movie: @movie, time: DateTime.current.strftime("%m%e%Y\t%l%M%p"), duration: "120")
      @party2 = @user.parties.create(user: @user, movie: @movie2, time: DateTime.current.strftime("%m%e%Y\t%l%M%p"))

      end

    it 'can have a navbar' do
      login_as(@user)
      visit user_dashboard_path(@user)

      expect(page).to have_link("Discover Movies")
    end

    it 'can block you from seeing me' do
      login_as(@user)
      visit user_dashboard_path(@user2)

      expect(current_path).to eq(root_path)

      visit user_dashboard_path(@user)

      expect(current_path).to eq(user_dashboard_path(@user))
    end

    it 'has friends and parties' do
      @invite.update!(status: 1)
      login_as(@user)
      visit user_dashboard_path(@user)
      within(".my_parties") do
        expect(page).to have_content(@party.movie.title)
        expect(page).to have_content(@party.duration)
        expect(page).to have_content(@party2.movie.title)
      end
    end

    it 'can accept friends' do
      login_as(@user2)
      visit user_dashboard_path(@user2)
      
      within("#invite-#{@invite.id}") do
        expect(page).to have_content(@user.email)
        click_on "Accept"
      end
    end

    it 'can reject friends' do
      login_as(@user2)
      visit user_dashboard_path(@user2)

      within("#invite-#{@invite.id}") do
        click_on "Reject"
      end

      expect(page).to_not have_content(@user.email)
    end

    it 'must be logged in' do
      visit user_dashboard_path(@user2)

      expect(current_path).to eq(root_path)
    end

    it 'can render invites' do
      guest = Guest.create!(party: @party, user: @user2)

      login_as(@user2)

      visit user_dashboard_path(@user2)

      within(".parties_im_invited_to") do
        expect(page).to have_content(@movie.title)
      end
    end

    it 'can create friends' do
      login_as(@user)

      visit user_dashboard_path(@user)

      fill_in "email", with: "#{@user3.email}"
      click_on "Add Friend"

      expect(current_path).to eq(user_dashboard_path(@user))

      logout(@user)
      login_as(@user3)
      visit user_dashboard_path(@user3)

      expect(page).to have_content(@user.email)
      click_button "Accept"

      expect(page).to have_content(@user.email)
    end
  end
end
