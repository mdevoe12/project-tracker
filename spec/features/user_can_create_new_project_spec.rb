require 'rails_helper'

RSpec.feature "User projects" do
  scenario "User can create new project" do

    visit new_project_path

    fill_in "project_name", with: "Build app"
    click_on "Create Project"

    expect(current_path).to eq(project_path(Project.last))
    expect(page).to have_content("Build app")
  end

  scenario "user inputs invalid data" do
    project = create(:project, name: "test")

    visit new_project_path

    fill_in "project_name", with: "test"
    click_on "Create Project"

    expect(page).to have_content("Project name already used")
  end
end
