class NoteStatus < ApplicationRecord
  belongs_to :note
  belongs_to :status
end
