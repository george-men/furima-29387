FactoryBot.define do
  factory :item do
    product_name { '魔法の本' }
    explanation { '読むだけで全て暗記できる本' }
    category_id { 2 }
    product_status_id { 2 }
    fee_burden_id { 2 }
    shipping_area_id { 2 }
    shipping_days_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image0.jpeg'), filename: 'image0.jpeg')
    end
  end
end
