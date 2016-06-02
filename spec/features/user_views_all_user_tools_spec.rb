require 'rails_helper'

RSpec.feature "User views all the users's tools" do
  scenario "user sees each tool linked to tool page" do

    #create user and user logs in
    user = User.create(username: "Anna", password: "password")
    visit login_path
    fill_in "session[username]", with: "Anna"
    fill_in "session[password]", with: "password"
    click_button "Login"
    #create tools for the user
    tool1 = Tool.create(name: "Hammer", price: 10.99, quantity: 2, user_id: user.id)
    tool2 = Tool.create(name: "Wrench", price: 12.00, quantity: 3, user_id: user.id)

    #user goes to user show page
    visit user_path(user)
    #user sees all tool names, quantity
    #tool names link to tool pages
    expect(page).to have_content "My Tools"
    expect(page).to have_content tool2.quantity
    expect(page).to have_link tool1.name, href: tool_path(tool1)
    expect(page).to have_link tool2.name, href: tool_path(tool2)
  end
end
