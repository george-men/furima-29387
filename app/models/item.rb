class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name
    validates :explanation
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :product_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :fee_burden_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shipping_days_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" }
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
