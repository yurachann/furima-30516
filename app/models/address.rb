class Address < ApplicationRecord
  belongs_to_active_hash :shipment_source
  belongs_to :record
end
