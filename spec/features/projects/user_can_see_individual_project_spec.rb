require 'rails_helper'

RSpec.feature "user can see individual project info" do
  scenario "user sees project info when the click on a project" do
    user = create(:user)
    project_1 = create(:project, user_id: user.id)
    project_2 = create(:project, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_projects_path(user)
    click_on "#{project_1.name}"

    expect(current_path).to eq(user_project_path(user, project_1))
  end
end
