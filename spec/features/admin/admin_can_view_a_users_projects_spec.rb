require 'rails_helper'

RSpec.feature "an admin can view all of a user's projects" do
  scenario "when they click on a user from the user index" do
    admin = create(:user, role: 1)
    user_1 = create(:user, username: "Test")
    project = create(:project, user_id: user_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    click_on user_1.username

    expect(current_path).to eq(admin_user_path(user_1))
    expect(page).to have_content(user_1.username)
    expect(page).to have_content(project.name)
  end
end
