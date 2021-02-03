require 'rails_helper'

RSpec.describe "Logging in" do
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