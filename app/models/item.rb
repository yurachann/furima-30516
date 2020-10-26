class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipment_date
  
  belongs_to       :user
  has_one_attached :image
  
end
