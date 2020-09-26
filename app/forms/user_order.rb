class UserOrder

  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :address, :phone_number, :token

  with_options presence: true do
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid. Include nonehyphen(-)"}
    validates :token
  end
  
  def save
 
    user = User.create

    item = Item.create
  
    Addresse.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, order_id: order.id)

    Order.create(item_id: item.id, user_id: user.id)
  end

end