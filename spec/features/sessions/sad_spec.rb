require 'rails_helper'

RSpec.describe "Logging in" do
  it "cannot log in with invalid credentials" do
    user = User.create(email: "user@example.com", password: "hunter2")

    visit root_path

    login = "Log in"

    click_link login

    fill_in :user_email, with: "user@notexample.com"
    fill_in :user_password, with: user.password
    click_on login

    expect(current_path).to eq(user_session_path)

    fill_in :user_email, with: "user@example.com"
    fill_in :user_password, with: "hunter"

    click_link login

    expect(current_path).to eq(user_session_path)
  end
end