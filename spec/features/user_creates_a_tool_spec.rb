require 'rails_helper'

RSpec.feature "Tool management", type: :feature do
  scenario "user creates a new tool" do
    user = User.create(username: "anna", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Login"
    # vist a page with the form to create a new tool
    visit new_user_tool_path(user)

    #fill in tools attributes: name, price, quantity
    fill_in "Name", with: "Screwdriver"
          #finding based on label
    fill_in "Price", with: 10.99
    fill_in "tool[quantity]", with: 10
          #finding based on form field name

    #submit the form
    find(:button, "Create Tool").click

    #check and see that I am on the tool show page
    expect(current_path).to eq(tool_path(Tool.last.id))

    #check that all the attributes I filled in and aubmitted are displying on the page
    within(".tool_info li:nth-child(1)") do
          #html class. can also be "div", "li", or #id_name. can nest.
        expect(page).to have_content("Screwdriver")
      end

    within(".tool_info li:nth-child(2)") do
      expect(page).to have_content("$10.99")
    end


  end
end
