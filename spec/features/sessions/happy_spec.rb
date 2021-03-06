require 'rails_helper'

RSpec.describe "Logging" do
  describe "In" do
    it "can log in with valid credentials" do
      user = User.create(email: "user@example.com", password: "hunter2")
      
      visit root_path
      
      login = "Log in"
      
      click_on login
      
      fill_in :user_email, with: user.email
      fill_in 'user[password]', with: user.password
      
      click_on login
      
      expect(current_path).to eq(user_dashboard_path(user))
    end
  end

  describe "Out" do
    it "can log out" do
      @user = User.create(email: "user@example.com", password: "hunter2")
      login_as(@user)
      logout = "Log out"
      login = "Log in"
      visit root_path
      expect(page).to_not have_link(login)

      click_link logout

      expect(current_path).to eq(root_path)
      expect(page).to have_link(login)
    end
  end
end