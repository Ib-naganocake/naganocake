class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :price_including_tax, presence:true
  validates :amount, presence:true

  enum production_status: { waiting: 0, producting: 1, complete: 2, impossible: 3 }

end
