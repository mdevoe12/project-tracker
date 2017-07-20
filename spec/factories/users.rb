FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "username #{n}"
    end
    password_digest "MyString"
    first_name "MyString"
    last_name "MyString"
    email "MyString"

  end
end
