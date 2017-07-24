require 'rails_helper'

RSpec.feature "User projects" do
  scenario "User can create new project" do
    user = create(:user)
    status = create(:status, name: "Completed")
    

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_project_path(user)

    fill_in "project_name", with: "Party on"
    click_on "Create Project"
    expect(current_path).to eq(user_project_path(user, Project.last))
    expect(page).to have_content("Party on")
  end

  scenario "user inputs invalid data" do
    user = create(:user)
    project = create(:project, name: "test", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_project_path(user)

    fill_in "project_name", with: "test"
    click_on "Create Project"

    expect(page).to have_content("Project name already used")
  end
end
