require 'rails_helper'

RSpec.feature "a user can add tags to a project" do
  scenario "when on the project show page" do
    user = create(:user)
    project = create(:project, user_id: user.id)
    status = create(:status, name: "Completed")
    note = create(:note, project_id: project.id, status_id: status.id)


    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_project_path(project.user, project)

    expect(page).to have_content(project.name)
    click_on "edit"
    fill_in "project_name", with: "updated name"
    fill_in "project_tag_list", with: "sample tag"
    click_on "Update Project"

    expect(current_path).to eq(user_project_path(user, project))
    expect(page).to have_content("sample tag")
  end
end
