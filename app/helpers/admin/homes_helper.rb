module Admin::HomesHelper
  def customer_full_name(order)
    "#{order.customer.family_name} #{order.customer.first_name}"
  end
end