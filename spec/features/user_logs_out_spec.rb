require 'rails_helper'

RSpec.feature "User logs out" do
  scenario "logged in user can logout" do
    user = User.create(username: "anna", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content("Welcome, anna")

    click_on "Logout"
    expect(page).to have_no_content("Welcome")

  end
end
