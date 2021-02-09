require 'rails_helper'

RSpec.describe "Making a new Party" do
  describe "It shows movie title and duration" do
    before :each do
      @host = User.create(email: 'host@example.com', password: 'hunter2')
      @friend = User.create(email: 'friend@example.com', password: 'hunter2')
      @friendship = Friendship.create(user: @host, friend: @friend)
      @stranger = User.create(email: 'stranger@example.com', password: 'hunter2')

      login_as(@host)

      visit user_dashboard_path(@host)

      click_on "Discover Movies"
      fill_in 'query', with: "The Departed"
      click_on "Find Movies"
      click_on "The Departed"
      click_on "Create A Party"
    end

    it "Shows uneditable title" do
      expect(current_path).to eq(new_party_path)
      within("#movie-title") do
        expect(page).to have_content("The Departed")
      end
      have_selector("input",
                    :type => "number",
                    :name => "party[duration]",
                    :value => "151")

      fill_in "party[duration]", with: 300
      fill_in "party[time]", with: DateTime.current.strftime("%m%e%Y\t%l%M%p")
      click_on "Create Party"
      expect(page).to have_content("The Departed")
    end

    it "can invite friends to party" do
      @friendship.update!(status: 1)
      visit user_dashboard_path(@host)
      click_on "Discover Movies"
      fill_in 'query', with: "The Departed"
      click_on "Find Movies"
      click_on "The Departed"
      click_on "Create A Party"
      fill_in 'party[duration]', with: "90"
      page.check("party_guests_#{@friend.id}")
      expect(page).to_not have_content(@stranger.email)

      click_on 'Create Party'
      expect(current_path).to eq(user_dashboard_path(@host))
    end
  end
end