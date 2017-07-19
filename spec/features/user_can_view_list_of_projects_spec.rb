require 'rails_helper'

RSpec.feature "A user can see a list of projects" do
  scenario "when they visit the project index" do
    project_1 = create(:project)
    project_2 = create(:project)

    visit projects_path

    expect(page).to have_content(project_1.name)
    expect(page).to have_content(project_2.name)
  end


end
