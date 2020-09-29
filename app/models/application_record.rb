class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
with_options presence: true do
  validates :name
  validates :text
  validates :category_id
  validates :condition_id
  validates :shipping_fee_id
  validates :shipping_area_id
  validates :delivery_day_id
  validates :price, numericality: { greater_than:299,less_than:10000000 }
end
end
