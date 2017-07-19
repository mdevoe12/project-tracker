require 'rails_helper'

RSpec.feature "A user can delete existing note" do
  scenario "when they click delete from the note path" do
    project = create(:project)
    note_1 = create(:note, project_id: project.id)
    note_2 = create(:note, project_id: project.id)

    visit project_path(project)
    expect(page).to have_content(note_1.title)
    expect(page).to have_content(note_2.title)
    click_on note_1.title
    click_on "delete"

    expect(current_path).to eq(project_path(project))
    expect(page).to_not have_content(note_1.title)
    expect(page).to have_content(note_2.title)    
  end
end
