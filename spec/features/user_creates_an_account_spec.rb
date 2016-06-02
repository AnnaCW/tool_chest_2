require 'rails_helper'

RSpec.feature "User creates an account" do
  scenario "user sees welcome, name" do

    visit new_user_path

    fill_in "Username", with: "anna"
    fill_in "Password", with: "password"
    click_on "Create Account"

    expect(page).to have_content("Welcome, anna")
    
  end
end
