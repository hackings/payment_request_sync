FactoryBot.define do
  factory :payment_request do
    user_id { "MyString" }
    amount { "9.99" }
    currency { "MyString" }
    description { "MyText" }
    status { 1 }
  end
end
