class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
 
  def show
  end

  def edit
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :product_status_id, :fee_burden_id, :shipping_area_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end

end
