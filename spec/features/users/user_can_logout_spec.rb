require 'rails_helper'

RSpec.feature "a user can logout" do
  scenario "when they click logout" do
    user = create(:user, username: "steve", password: "steve")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "session[password]", with: "steve"
    click_button "Login"

    expect(page).to have_content("Welcome, #{user.first_name}")

    click_on "Logout"

    expect(page).to_not have_content("Welcome, #{user.first_name}")
  end
end
