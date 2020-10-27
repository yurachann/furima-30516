FactoryBot.define do
  factory :item do
    title               { Faker::Lorem.word }
    explain             { Faker::Lorem.sentence }
    category_id         { Faker::Number.between(from: 2, to: 10) }
    condition_id        { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id  { Faker::Number.between(from: 2, to: 3) }
    shipment_source_id  { Faker::Number.between(from: 2, to: 48) }
    shipment_date_id    { Faker::Number.between(from: 2, to: 4) }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |sample|
      sample.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
