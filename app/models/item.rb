class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :postage
  belongs_to :region
  belongs_to :shipment


  validates :title, presence: true
  validates :textbox, presence: true
  validates :price, numericality: { grater_than: 300, less_than_or_equal: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_id, numericality: { other_than: 1 , message: "can't be blank"}
end
