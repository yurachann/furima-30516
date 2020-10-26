class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipment_date
  
  belongs_to       :user
  has_one_attached :image

  validates :title, :explain, :category, :condition, :shipping_charge, :shipment_source,:shipment_date, :price, :image, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :shipment_source_id, :shipment_date_id, numericality: { other_than: 1 } 
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
