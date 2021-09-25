FactoryBot.define do
  factory :item do
    name               { Faker::Commerce.product_name }
    price              { Faker::Commerce.price(range: 300..9999999, as_string: true) }
    explanation        { Faker::Lorem.sentence }
    category_id        { Faker::Number.within(range: 2..11) }
    condition_id       { Faker::Number.within(range: 2..7) }
    shippingcharges_id { Faker::Number.within(range: 2..3) }
    area_id            { Faker::Number.within(range: 2..48) }
    shippingdate_id    { Faker::Number.within(range: 2..4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
