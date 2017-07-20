FactoryGirl.define do
  factory :project do
    sequence :name do |n|
     "My Project #{n}"
   end
   user
  end
end
