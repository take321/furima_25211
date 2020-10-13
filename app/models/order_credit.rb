class OrderCredit

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_wards_towns, :address, :building_name, :phone, :item_id, :user_id, :price

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city_wards_towns
    validates :address
    validates :phone, format: {with: /\d{11}/}
    validates :user_id
    validates :token, presence: {message: "There is an error in the card information"}
  end


  def save(user_id, item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city_wards_towns: city_wards_towns, address: address, building_name: building_name, phone: phone, user_id: user_id, item_id: item_id)
    Order.create(user_id: user_id, item_id: item_id)
  end
end