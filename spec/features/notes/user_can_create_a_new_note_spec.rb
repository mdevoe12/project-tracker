require 'rails_helper'

RSpec.feature "A user can create a new note" do
  scenario  "when they enter valid information" do
    project = create(:project)
    title = "eat cake"
    content = "eating cake is a delicious undertaking"

    visit new_project_note_path(project)

    fill_in "note_title", with: title
    fill_in "note_content", with: content
    click_on "Create Note"

    expect(current_path).to eq(project_note_path(project, Note.last))
    expect(page).to have_content(title)
    expect(page).to have_content(content)
  end

  context "when they enter invalid information" do
    it "returns them to the edit page with error" do
      project = create(:project)
      title = ""
      content = "eating cake is a delicious undertaking"

      visit new_project_note_path(project)

      fill_in "note_title", with: title
      fill_in "note_content", with: content
      click_on "Create Note"

      expect(page).to have_content("Note title can't be blank")
    end
  end
end
