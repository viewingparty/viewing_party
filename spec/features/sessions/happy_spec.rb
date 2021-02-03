require 'rails_helper'

RSpec.describe "Logging in" do
  it "can log in with valid credentials" do
    user = User.create(email: "user@example.com", password: "hunter2")

    visit root_path

    click_button "Log In"

    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password

    save_and_open_page
    # click_button "Log In"

  end
end