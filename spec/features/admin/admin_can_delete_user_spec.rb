require 'rails_helper'

RSpec.feature "admin can delete user" do
  scenario "when they click delete from user path" do
    admin = create(:user, role: 1)
    user_1 = create(:user, username: "Test")
    user_2 = create(:user)
    project = create(:project, user_id: user_1.id)
    note = create(:note, project_id: project.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    expect(page).to have_content(user_1.username)
    expect(page).to have_content(user_2.username)

    click_on user_1.username
    click_on "delete"

    expect(current_path).to eq(admin_users_path)
    expect(page).to_not have_content(user_1.username)
    expect(page).to     have_content(user_2.username)

  end
end
