require 'rails_helper'

RSpec.describe "Making a new Party" do
  describe "It shows movie title and duration" do
    # Fill once API is up and running
    # before(:each) do
    #   VCR.insert_cassette("find_movie")
    # end

    # after(:each) do
    #   VCR.eject_cassette("find_movie")
    # end

    it "Shows uneditable title" do
      host = User.create(email: 'host@example.com', password: 'hunter2')
      friend = User.create(email: 'friend@example.com', password: 'hunter2')
      stranger = User.create(email: 'stranger@example.com', password: 'hunter2')


      visit root_path
      click_button "Log in"
      fill_in :user_email, with: host.email
      fill_in 'user[password]', with: host.password
      click_button "Log in"
      click_on "Discover Movies"
      fill_in 'query', with: "The Departed"
      click_on "Find Movies"
      click_on "The Departed"
      click_on "Create A Party"
      
      expect(current_path).to eq(new_party_path)
      

      have_selector("input",
                    :type => "number",
                    :name => "party[duration]",
                    :value => "151")

      fill_in "party[duration]", with: 300
      fill_in "party[time]", with: DateTime.current.strftime("%m%e%Y\t%l%M%p")
      click_on "Create Party"
      expect(current_path).to eq(user_dashboard_path(host))

      expect(page).to have_content("The Departed")
    end
  end

  describe "Create elements:" do
    xit "date" do
      host = User.create(email: 'host@example.com', password: 'hunter2')
      friend = User.create(email: 'friend@example.com', password: 'hunter2')
      stranger = User.create(email: 'stranger@example.com', password: 'hunter2')

      visit root_path

      click_button "Log in"

      fill_in :user_email, with: host.email
      fill_in 'user[password]', with: host.password

      click_button "Log in"

      visit new_party_path(host)

      fill_in :party_duration, with: "90"
      expect(page).to have_content(friend.email)

      page.check("invite-#{friend.id}")
      expect(page).to_not have_content(stranger.email)

      click_button create
    end
  end
end