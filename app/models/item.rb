class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash [:category,:condition,:shipping_fee,:shipping_area,:delivery_day.rb]
end
