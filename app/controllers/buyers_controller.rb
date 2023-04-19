class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @buyer_shopping = BuyerShopping.new
    if current_user == @item.user
      redirect_to root_path
    end
    unless @item.buyer == nil
      redirect_to root_path
    end
  end

  def create
    @buyer_shopping = BuyerShopping.new(buyer_params)
    if @buyer_shopping.valid?
      pay_item
      @buyer_shopping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.require(:buyer_shopping).permit(:post_code, :region_id, :municipality, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: buyer_params[:token], 
      currency: 'jpy'               
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end