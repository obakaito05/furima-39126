class Item < ApplicationRecord
  belongs_to :user


  validates :title, presence: true
  validates :textbox, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :prefecture_id, presence: true
  validates :postage_id, presence: true
  validates :region_id, presence: true
  validates :shipment_id, presence: true
end
