# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    first_name "MyString"
    email "MyString"
    phone "MyString"
    street_address "MyString"
    suburb "MyString"
    state "MyString"
    postcode "MyString"
    map_lat 1.5
    map_lng 1.5
  end
end
