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
end
