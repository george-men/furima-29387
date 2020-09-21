require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが存在していなければ保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'product_nameが空では保存できないこと' do
      @item.product_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it 'explanationが空では保存できないこと' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'categoryを選択していないと保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'product_statusを選択していないと保存できないこと' do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status can't be blank")
    end
    it 'fee_burdenを選択していないと保存できないこと' do
      @item.fee_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee burden can't be blank")
    end
    it 'shipping_areaを選択していないと保存できないこと' do
      @item.shipping_area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'shipping_daysを選択していないと保存できないこと' do
      @item.shipping_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end
    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid. Input half-width characters", "Price is out of setting range")
    end
    it 'priceが全角数字だと保存できないこと' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが300円未満では保存できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
  end
end
