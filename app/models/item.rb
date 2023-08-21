class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image
  validates :image, presence:true
  validates :name, presence:true, uniqueness: true
  validates :description, presence:true
  validates :price_without_tax, presence:true

  # 商品画像のサイズ調整
  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  def add_tax_price
      (self.price_without_tax * 1.1).floor
  end

end
