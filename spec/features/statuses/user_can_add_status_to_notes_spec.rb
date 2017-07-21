# require 'rails_helper'
#
# RSpec.feature "User can add status to notes" do
#   scenario "when on a note show page, a dropdown can be selected" do
#     note = create(:note)
#
#     visit user_project_note_path(note.project.user, note.project, note)
#
#     expect(page).to have_content(note.title)
#     select "Completed", from: "note_status_id"
#     click_on "Update Note"
#
#   end
# end
