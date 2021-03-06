class Order
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :item_purchase_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_code_id
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
  end

  validates :prefecture_code_id, numericality: { other_than: 1 }

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    SendingDestination.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end
