require 'rails_helper'

RSpec.feature "user can see individual project info" do
  scenario "user sees project info when the click on a project" do
    project_1 = create(:project)
    project_2 = create(:project)

    visit projects_path
    click_on "#{project_1.name}"

    expect(current_path).to eq(project_path(project_1))
  end
end
