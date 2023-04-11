class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end


  private
  def item_params
    params.require(:item).permit(:title, :textbox, :price, :category_id, :prefecture_id, :postage_id, :region_id, :shipment_id).merge(user_id: current_user.id)
  end
end
