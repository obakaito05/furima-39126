class BuyerShopping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building, :telephone, :user, :item, :buyer

  with_options presence: true do
    validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipality, presence: true
    validates :address, presence: true
    validates :telephone, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/}
  end

  def save
    buyer = Buyer.create(user: user, item: item)
    Shopping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, telephone: telephone)
  end
end