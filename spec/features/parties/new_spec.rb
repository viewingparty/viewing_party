require 'rails_helper'

RSpec.describe "Making a new Party" do
  describe "It shows movie title and duration" do
    # Fill once API is up and running
  end

  describe "Create elements:" do
    it "date" do
      host = User.create(email: 'host@example.com', password: 'hunter2')
      friend = User.create(email: 'friend@example.com', password: 'hunter2')
      stranger = User.create(email: 'stranger@example.com', password: 'hunter2')

      visit root_path

      click_button "Log in"

      fill_in :user_email, with: host.email
      fill_in 'user[password]', with: host.password

      click_button login

      visit new_party_path(host)

      fill_in :party_duration, with: "90"
      expect(page).to have_content(friend.email)

      page.check("invite-#{friend.id}")
      expect(page).to_not have_content(stranger.email)

      click_button create
    end
  end
end