class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :goods_condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :name
    validates :description
    validates :category 
    validates :goods_condition
    validates :postage_type
    validates :delivery_area
    validates :preparation_day
    validates :price
    validates :user
  end

  validates :genre_id, :goods_condition_id, :postage_type_id, :delivery_area, :preparation_day, numericality: { other_than: 1 }
  
  has_one_attached :image
end