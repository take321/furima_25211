require 'faker'
Faker::Config.locale = :ja

FactoryBot.define do
  factory :item do
    name             {Faker::Food.description}
    text             {Faker::Food.ingredient}
    category_id      {Faker::Number.within(range: 2..10)}
    condition_id     {Faker::Number.within(range: 2..10)}
    shipping_fee_id  {Faker::Number.within(range: 2..10)}
    shipping_area_id {Faker::Number.within(range: 2..10)}
    delivery_day_id  {Faker::Number.within(range: 2..10)}
    price            {Faker::Number.within(range: 300..9999999)}
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
