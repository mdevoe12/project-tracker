class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :notes, dependent: :destroy
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  def pie_chart
    notes.group(:status).count.map { |k, v| [k.name, v] }
  end

  def completion_rate
    completed = Status.find_by(name: "Completed")
    count = (notes.where(status: completed.id).count).to_f
    count != 0 ? ("#{((count) / (notes.count)).round(2) * 100} % Complete") : ("0 % Complete")
  end
end
