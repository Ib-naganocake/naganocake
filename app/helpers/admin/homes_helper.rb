module Admin::HomesHelper

  def calculate_order_total_amount(order)
    total_amount = 0
    order.order_details.each do |order_detail|
      total_amount += order_detail.amount
    end
    total_amount
  end
end