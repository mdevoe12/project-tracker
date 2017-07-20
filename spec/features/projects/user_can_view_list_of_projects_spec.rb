require 'rails_helper'

RSpec.feature "A user can see a list of projects" do
  scenario "when they visit the project index" do
    user = create(:user)
    project_1 = create(:project, user_id: user.id)
    project_2 = create(:project, user_id: user.id)

    visit user_projects_path(user)

    expect(page).to have_content(project_1.name)
    expect(page).to have_content(project_2.name)
  end


end
