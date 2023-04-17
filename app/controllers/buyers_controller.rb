class BuyersController < ApplicationController

  def index
    @buyer_shopping = BuyerShopping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer_shopping = BuyerShopping.new(buyer_params)
    if @buyer_shopping.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def buyer_params
    params.require(:buyer_shopping).permit(:post_code, :prefecture_id, :municipality, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end