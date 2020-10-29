class Record < ApplicationRecord
  validates :price, presence: true
end
