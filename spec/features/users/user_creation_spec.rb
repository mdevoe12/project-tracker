require 'rails_helper'

RSpec.feature "A person can create a new user" do
  scenario "when they try to create a user from the home page" do
    visit new_user_path

    fill_in "user_first_name", with: "Matt"
    fill_in "user_last_name", with: "DeVoe"
    fill_in "user_email", with: "matthew.devoe@gmail.com"
    fill_in "user_username", with: "mdevoe12"
    fill_in "user_password", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Welcome, Matt")
  end
end
