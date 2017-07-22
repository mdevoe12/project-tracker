require 'rails_helper'

RSpec.feature "A user can delete existing note" do
  scenario "when they click delete from the note path" do
    user = create(:user)
    project = create(:project, user_id: user.id)
    status = create(:status)
    note_1 = create(:note, project_id: project.id, status_id: status.id)
    note_2 = create(:note, project_id: project.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_project_path(user, project)
    expect(page).to have_content(note_1.title)
    expect(page).to have_content(note_2.title)
    click_on note_1.title
    click_on "delete"

    expect(current_path).to eq(user_project_path(user, project))
    expect(page).to_not have_content(note_1.title)
    expect(page).to have_content(note_2.title)
  end
end
