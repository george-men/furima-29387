class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  belongs_to :user

  with_options presence: true do
    validates :product_name
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :product_status_id, numericality: { other_than: 1 }
    validates :fee_burden_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_days_id, numericality: { other_than: 1 }
    validates :price 
  end
end
