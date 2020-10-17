class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

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
    validates :image
  end
  
  with_options numericality: {other_than: 1 } do
    validates :category_id 
    validates :goods_condition_id
    validates :postage_type_id
    validates :delivery_area_id
    validates :preparation_day_id 
  end
  
  #validates :category_id, :goods_condition_id, :postage_type_id, :delivery_area_id, :preparation_day_id, :numericality, :preparation_day, { other_than: 1 }
  
end