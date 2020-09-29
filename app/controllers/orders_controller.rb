class OrdersController < ApplicationController
  before_action :move_do_index, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = UserOrder.new
  end

  def new
    @order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_number, :prefecture_id, :city, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の送り先など
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_do_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id
      redirect_to root_path
    elsif item.order.present?
      redirect_to root_path
    end
  end
end
