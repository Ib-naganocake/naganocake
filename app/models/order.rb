class Order < ApplicationRecord
  has_many :order_datails, dependent: :destroy
  belongs_to :customer

  validates :total_price, presence:true
  validates :shipping_fee, presence:true
  validates :payment_method, presence:true
  validates :postal_code, presence:true
  validates :shipping_address, presence:true
  validates :name, presence:true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum transaction_status: { waiting: 0, paid_up: 1, producting: 2, preparing: 3, shipped: 4 }
  
  def self.status
    case transaction_status
      when 0 then
        "入金待ち"
      when 1 then
        "入金確認"
      when 2 then
        "製作中"
      when 3 then
        "発送準備中"
      when 4 then
        "発送済み"
    end
  end
  
end
