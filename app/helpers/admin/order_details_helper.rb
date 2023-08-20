module Admin::OrderDetailsHelper

  def calculate_subtotal(order_detail)
    subtotal = order_detail.price_including_tax * order_detail.amount
    subtotal
  end
end