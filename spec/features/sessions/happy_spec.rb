require 'rails_helper'

RSpec.describe "Logging" do
  describe "In" do
    it "can log in with valid credentials" do
      user = User.create(email: "user@example.com", password: "hunter2")
      
      visit root_path
      
      login = "Log in"
      
      click_button login
      
      fill_in :user_email, with: user.email
      fill_in 'user[password]', with: user.password
      
      click_button login
      
      expect(current_path).to eq(user_dashboard_path(user))
    end
  end

  describe "Out" do
    it "can log out" do
      user = User.create(email: "user@example.com", password: "hunter2")
      
      visit root_path
      
      login = "Log in"
      logout = "Log out"
      
      click_button login
      
      fill_in :user_email, with: user.email
      fill_in 'user[password]', with: user.password
      
      click_button login

      expect(page).to_not have_button(login)

      click_button logout

      expect(current_path).to eq(root_path)
      expect(page).to have_button(login)
    end
  end
end