require 'rails_helper'

RSpec.feature "a person will see the welcome page" do
  scenario "when they visit the root page" do
    visit root_path

    expect(page).to have_content("Welcome to Project Tracker")
  end
end
