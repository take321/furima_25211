class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture
  has_one_attached :image
  validates :name, :text, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :delivery_day_id, :price, :image, presence: true
  validates :price, numericality: { greater_than:299,less_than:10000000 }
  validates :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :delivery_day_id, numericality: { other_than: 1 }
end
