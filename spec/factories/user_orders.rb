FactoryBot.define do
  factory :user_order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_number { '123-4567' }
    prefecture_id { 2 }
    city { '平塚市' }
    address { '中原２' }
    building_name { 'フィールド123' }
    phone_number { '08012345678' }
  end
end
