FactoryGirl.define do
  factory :project do
    sequence :name do |n|
     "My Project #{n}"
   end
  end
end
