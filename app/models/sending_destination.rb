class SendingDestination < ApplicationRecord
  belongs_to :item_purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_code

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]+\z/ },
    validates :prefecture_code
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/ },
  end

  varidates :building_name
  varidates :prefecture_code_id, numericality: { other_than: 1 } 
end