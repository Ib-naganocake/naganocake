module Admin::OrderDetailsHelper

  def calculate_subtotal(order_detail)
    subtotal = order_detail.price_including_tax * order_detail.amount
    subtotal
  end

  def transaction_status_options(order)
    case order.transaction_status
    when "waiting", "paid_up", "shipped"
      options_for_transaction_status
    end
  end

  def options_for_transaction_status
    [
      [I18n.t("enums.order.transaction_status.pending"), "waiting"],
      [I18n.t("enums.order.transaction_status.paid_up"), "paid_up"],
      [I18n.t("enums.order.transaction_status.shipped"), "shipped"]
    ]
  end
end