require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入' do
    before do
      @order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end
    it 'building_nameが空でも保存できること' do
      @order.building_name = nil
      expect(@order).to be_valid
    end

    it 'tokenが空では保存できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_numberが空では保存できないこと' do
      @order.postal_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal number can't be blank", 'Postal number is invalid. Include hyphen(-)')
    end
    it 'postal_numberに「−」が無いと保存できないこと' do
      @order.postal_number = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal number is invalid. Include hyphen(-)')
    end
    it 'prefecture_idが選択されていなければ保存できないこと' do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空では保存できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空では保存できないこと' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空では保存できないこと' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid. Include nonehyphen(-) or numover')
    end
    it 'phone_numberに「−」が入っていると保存できないこと' do
      @order.phone_number = '080-3232-4444'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid. Include nonehyphen(-) or numover')
    end
    it 'phone_numberが12桁以上であると保存できないこと' do
      @order.phone_number = '0803232456789'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid. Include nonehyphen(-) or numover')
    end
  end
end
