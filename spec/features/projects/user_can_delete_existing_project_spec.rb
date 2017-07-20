require 'rails_helper'

RSpec.feature "user can delete existing project" do
  scenario "while on project show page" do
    user = create(:user)
    project_1 = create(:project, user_id: user.id)
    project_2 = create(:project, user_id: user.id)

    visit user_projects_path(user)
    click_on "#{project_1.name}"
    click_on "Delete '#{project_1.name}' Project"

    expect(current_path).to eq(user_projects_path(user))
    expect(page).to have_content(project_2.name)
    expect(page).to_not have_content(project_1.name)
  end
end
