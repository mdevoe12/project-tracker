require 'rails_helper'

RSpec.feature "user can edit existing project" do
  scenario "when they visit the edit path" do
    project = create(:project)

    visit edit_project_path(project)
    fill_in "project_name", with: "updated name"
    click_on "Update Project"

    expect(current_path).to eq(project_path(project))
    expect(page).to have_content("updated name")
  end

  scenario "fails when they input invalid data" do
    project_1 = create(:project, name: "build rocket")
    project_2 = create(:project)

    visit edit_project_path(project_2)
    fill_in "project_name", with: "build rocket"
    click_on "Update Project"

    expect(page).to have_content("Project name already used")
  end
end
