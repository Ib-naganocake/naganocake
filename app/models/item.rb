class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_datails, dependent: :destroy
  belongs_to :genre

  has_one_attached :image
  validates :name, presence:true, uniqueness: true
  validates :description, presence:true
  validates :price_without_tax, presence:true

  # 商品画像のサイズ調整
  def get_image(width, height)
    unless image.attached?
      # 商品画像がない場合はimages/no-image.jpgを参照
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
  image.variant(resize_to_limit: [width, height]).processed
  end

  def add_tax_price
      (self.price_without_tax * 1.1).round
  end
  
end
