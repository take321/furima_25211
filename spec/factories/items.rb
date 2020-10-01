require 'faker'
Faker::Config.locale = :ja

FactoryBot.define do
  factory :item do
    name             {Faker::Restaurant.name}
    text             {Faker::Restaurant.description}
    category_id      {Faker::Number.within(range: 2..10)}
    condition_id     {Faker::Number.within(range: 2..10)}
    shipping_fee_id  {Faker::Number.within(range: 2..10)}
    shipping_area_id {Faker::Number.within(range: 2..10)}
    delivery_day_id  {Faker::Number.within(range: 2..10)}
    price            {Faker::Number.within(range: 300..9999999)}
    image            {Faker::Internet.url}
  end
end
