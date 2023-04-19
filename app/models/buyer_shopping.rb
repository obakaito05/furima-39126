class BuyerShopping
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :municipality, :address, :building, :telephone, :user_id, :item_id, :buyer_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipality
    validates :address
    validates :telephone, format: { with: /\A\d{10}$|^\d{11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Shopping.create(post_code: post_code, region_id: region_id, municipality: municipality, address: address, building: building, telephone: telephone, buyer_id: buyer_id)
  end
end