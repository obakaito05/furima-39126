class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :postage
  belongs_to :region
  belongs_to :shipment
  has_one :buyer

  validates :image, presence: true
  validates :title, presence: true
  validates :textbox, presence: true
  validates :price, numericality: { greater_than: 299, less_than: 10_000_000, only_integer: true }
  validates :category_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :postage_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :region_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :shipment_id, numericality: { other_than: 1 , message: "を選択してください"}
end
