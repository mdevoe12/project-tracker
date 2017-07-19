require 'rails_helper'

RSpec.feature "user can delete existing project" do
  scenario "while on project show page" do
    project_1 = create(:project)
    project_2 = create(:project)

    visit projects_path
    click_on "#{project_1.name}"
    click_on "Delete '#{project_1.name}' Project"

    expect(current_path).to eq(projects_path)
    expect(page).to have_content(project_2.name)
    expect(page).to_not have_content(project_1.name)
  end
end
