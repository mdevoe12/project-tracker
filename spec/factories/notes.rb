FactoryGirl.define do
  factory :note do
    sequence :title do |n|
      "Title #{n}"
    end
    content "This is my content"
    project
  end
end
