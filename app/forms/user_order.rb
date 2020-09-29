class UserOrder

  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :address, :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid. Include nonehyphen(-) or numover"}
    validates :token
  end
  
  def save
    
    order =  Order.create(item_id: item_id, user_id: user_id)
  
    Addresse.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,  phone_number: phone_number, order_id: order.id)

  end

end