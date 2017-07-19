require 'rails_helper'

RSpec.feature "User views note" do
  scenario "when they view the note's show page" do
    project = create(:project)
    note = create(:note, project_id: project.id, content: "grapefruit is bad")

    visit project_path(project)

    click_on note.title

    expect(current_path).to eq(project_note_path(project, note))
    expect(page).to have_content(note.title)
    expect(page).to have_content(note.content)
  end
end
