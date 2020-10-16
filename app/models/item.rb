class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :goods_condition, :postage_type, :delivery_area, :preparation_day

  with_options presence: true do
    validates :name
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