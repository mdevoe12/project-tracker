require 'rails_helper'

RSpec.feature "a user can login" do
  scenario "when they enter credentials in the login field" do
    user = create(:user, username: "steve", password: "steve")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "session[password]", with: "steve"
    click_button "Login"

    expect(page).to have_content("Welcome, #{user.first_name}")
  end

  context "when they enter invalid credentials" do
    it "returns an error and returns them to the login page" do
      user = create(:user, username: "steve", password: "steve")

      visit login_path
      fill_in "Username", with: user.username
      fill_in "session[password]", with: "steve-pie"
      click_button "Login"

      expect(page).to have_content("Invalid username or password, please try again")
    end
  end
end
