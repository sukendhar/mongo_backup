# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    business_name "MyString"
    members ""
    product_name "MyString"
    description "MyText"
    product_url "MyString"
    price "MyString"
  end
end
