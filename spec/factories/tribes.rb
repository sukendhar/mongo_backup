# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tribe do
    tribe_name "MyString"
    category "MyString"
    members ""
    offers ""
    amount_saved 1
  end
end
