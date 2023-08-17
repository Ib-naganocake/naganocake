class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_datails, dependent: :destroy
  belongs_to :genre

  has_one_attached :image
  validates :name, presence:true
  validates :description, presence:true
  validates :price_without_tax, presence:true
end
