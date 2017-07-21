class Note < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  belongs_to :statuses, optional: true

end
