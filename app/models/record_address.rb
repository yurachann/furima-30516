class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :city, :house_number, :building_number, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code,        format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :shipment_source_id, numericality: { other_than: 1 } 
    validates :city           
    validates :house_number    
    validates :phone_number,       format: {with: /\A\d{10,11}\z/}  
  end
  
  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, record_id: record.id)
  end
end
