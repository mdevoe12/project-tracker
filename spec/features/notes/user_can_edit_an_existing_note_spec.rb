require 'rails_helper'

RSpec.feature "A user can edit an existing note" do
  scenario "when they click on 'edit' from note path" do
    user = create(:user)
    project = create(:project, user_id: user.id)
    note = create(:note)

    visit user_project_note_path(user, project, note)
    click_on "edit"
    fill_in "note_title", with: "new title"
    fill_in "note_content", with: "new content"
    click_on "Update Note"

    expect(current_path).to eq(user_project_note_path(user, project, note))
    expect(page).to have_content("new title")
    expect(page).to have_content("new content")
  end

  context "when the submit invalid information" do
    it "reroutes them to the edit page and throws an error" do
      user = create(:user)
      project = create(:project, user_id: user.id)
      note = create(:note)

        visit user_project_note_path(user, project, note)
        click_on "edit"
        fill_in "note_title", with: ""
        fill_in "note_content", with: "new content"
        click_on "Update Note"

        expect(page).to have_content("Not valid")
    end
  end
end
