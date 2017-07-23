require 'rails_helper'

RSpec.feature "user can edit existing project" do
  scenario "when they visit the edit path" do
    user = create(:user)
    project = create(:project, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_user_project_path(user, project)
    fill_in "project_name", with: "updated name"
    click_on "Update Project"

    expect(current_path).to eq(user_project_path(user, project))
    expect(page).to have_content("updated name")
  end

  scenario "fails when they input invalid data" do
    user = create(:user)
    project_1 = create(:project, user_id: user.id, name: "build rocket")
    project_2 = create(:project, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


    visit edit_user_project_path(user, project_2)
    fill_in "project_name", with: "build rocket"
    click_on "Update Project"

    expect(page).to have_content("Project name already used")
  end
end
