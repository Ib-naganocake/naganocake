module Admin::HomesHelper
  
  def calculate_order_total_amount(order)
    total_amount = 0
    order.order_datails.each do |order_datail|
      total_amount += order_datail.amount
    end
    total_amount
  end
end