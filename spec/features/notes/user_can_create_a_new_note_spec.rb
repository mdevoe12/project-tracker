require 'rails_helper'

RSpec.feature "A user can create a new note" do
  scenario  "when they enter valid information" do
    user = create(:user)
    project = create(:project, user_id: user.id)
    title = "eat cake"
    content = "eating cake is a delicious undertaking"
    status = Status.create(name: "Completed")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_project_note_path(user, project)

    fill_in "note_title", with: title
    fill_in "note_content", with: content
    select "Completed", from: "note_status_id"
    click_on "Create Note"

    expect(current_path).to eq(user_project_note_path(user, project, Note.last))
    expect(page).to have_content(title)
    expect(page).to have_content(content)
    expect(page).to have_content(status.name)
  end

  context "when they enter invalid information" do
    it "returns them to the edit page with error" do
      user = create(:user)
      project = create(:project, user_id: user.id)
      title = ""
      content = "eating cake is a delicious undertaking"
      status = Status.create(name: "Completed")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_user_project_note_path(user, project)

      fill_in "note_title", with: title
      fill_in "note_content", with: content
      select "Completed", from: "note_status_id"
      click_on "Create Note"

      expect(page).to have_content("Note title can't be blank")
    end
  end
end
