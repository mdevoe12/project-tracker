require 'rails_helper'

RSpec.feature "A user can edit an existing note" do
  scenario "when they click on 'edit' from note path" do
    note = create(:note)

    visit project_note_path(note.project, note)
    click_on "edit"
    fill_in "note_title", with: "new title"
    fill_in "note_content", with: "new content"
    click_on "Update Note"

    expect(current_path).to eq(project_note_path(note.project, note))
    expect(page).to have_content("new title")
    expect(page).to have_content("new content")
  end

  context "when the submit invalid information" do
    it "reroutes them to the edit page and throws an error" do
        note = create(:note)

        visit project_note_path(note.project, note)
        click_on "edit"
        fill_in "note_title", with: ""
        fill_in "note_content", with: "new content"
        click_on "Update Note"

        expect(page).to have_content("Not valid")
    end
  end
end
