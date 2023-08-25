class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amount, presence:true,numericality: { greater_than_or_equal_to: 1, less_than: 100 }
end
