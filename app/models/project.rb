class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :notes
  belongs_to :user
end
