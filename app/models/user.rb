class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :projects, dependent: :destroy
  enum role: %w(default admin)
end
