class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExttensions
  belongs_to_active_hash :prefectures
end
