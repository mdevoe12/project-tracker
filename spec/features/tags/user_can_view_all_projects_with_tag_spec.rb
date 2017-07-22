require 'rails_helper'

RSpec.feature "a user can see all related projects" do
  scenario "when they click on tag's link" do
    user = create(:user)
    project = create(:project, user_id: user.id)
    tag = project.tags.create(name: "doomsday plans")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_project_path(user, project)
    click_on tag.name

    expect(current_path).to eq(tag_path(tag))
    expect(page).to have_content(project.name)
  end
end
