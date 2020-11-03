FactoryBot.define do
  factory :record_address do
    postal_code        { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    shipment_source_id { Faker::Number.between(from: 2, to: 48) }
    city               { Faker::Address.city }
    house_number       { Faker::Address.street_address }
    phone_number       { Faker::Number.number(digits: 10) }
    token              { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
