class Note < ApplicationRecord
  belongs_to :project
  belongs_to :status, optional: true
  validates :title, presence: true
end
