class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_datails, dependent: :destroy
  belongs_to :genre

  has_one_attached :image
  validates :name, presence:true
  validates :description, presence:true
  validates :price_without_tax, presence:true
  
  # 商品画像のサイズ調整
  def get_imagee(weight, height)
    unless image.attached?
      # 商品画像がない場合はimages/no-image.jpgを参照
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      イメージ名.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
  image.variant(resize_to_limit: [weight, height]).processed
  end
  
end
