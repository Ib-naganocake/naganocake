class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  has_many :items, through: :order_details

  validates :total_price, presence:true
  validates :shipping_fee, presence:true
  validates :payment_method, presence:true
  validates :postal_code, presence:true
  validates :shipping_address, presence:true
  validates :name, presence:true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum transaction_status: { waiting: 0, paid_up: 1, producting: 2, preparing: 3, shipped: 4 }
  
end
