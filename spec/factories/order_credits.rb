require 'faker'
Faker::Config.locale = :ja

FactoryBot.define do
  factory :order_credit do
    postal_code      {Faker::Address.postcode}
    prefecture_id    {Faker::Number.within(range: 2..48)}
    city_wards_towns {Faker::Address.state}
    address          {"青山1-1-1"}
    building_name    {"タケウチハイツ"}
    phone            {Faker::Number.number(digits: 11)}
    token            {"tok_26ee5080b474ef3b538d6659620d"}
  end
end
