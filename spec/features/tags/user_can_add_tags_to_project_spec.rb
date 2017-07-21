require 'rails_helper'

RSpec.feature "user can create a tag" do
  scenario "from the project show page" do
    project = create(:project)

    visit user_project_path(project.user, project)
    click_on "create a new tag"
    fill_in "tag_name", with: "sample"
    click_on "Create Tag"

    expect(current_path).to eq(user_project_path(project.user, project))
    expect(page).to have_content()
  end
end
