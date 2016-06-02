require 'rails_helper'

RSpec.feature "User Signs In" do
  scenario "user sees a link to sign out" do
    user = User.create(username: "anna", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content("Logout")
  end
end
