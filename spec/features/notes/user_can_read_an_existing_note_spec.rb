require 'rails_helper'

RSpec.feature "User views note" do
  scenario "when they view the note's show page" do
    user = create(:user)
    project = create(:project, user_id: user.id)
    status = create(:status, name: "Completed")
    note = create(:note, project_id: project.id,
                  content: "grapefruit is bad", status_id: status.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_project_path(user, project)

    click_on note.title

    expect(current_path).to eq(user_project_note_path(user, project, note))
    expect(page).to have_content(note.title)
    expect(page).to have_content(note.content)
  end
end
