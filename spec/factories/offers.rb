# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    business_name "MyString"
    price_discount "MyString"
    min_no_of_buyer 1
  end
end
