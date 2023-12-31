module Admin::OrdersHelper

  def calculate_order_total_amount(order)
    total_amount = 0
    order.order_details.each do |order_detail|
      total_amount += order_detail.amount
    end
    total_amount
  end

  def customer_full_name(order)
    "#{order.customer.family_name} #{order.customer.first_name}"
  end

  def transaction_status_options(order)
    case order.transaction_status
    when "waiting"
      order_options_for_waiting(order)
    when "preparing"
      order_options_for_preparing(order)
    else
      [[I18n.t("enums.order.transaction_status.#{order.transaction_status}"), order.transaction_status]]
    end
  end

  def order_options_for_waiting(order)
    [
      [I18n.t("enums.order.transaction_status.#{order.transaction_status}"), order.transaction_status],
      [I18n.t("enums.order.transaction_status.paid_up"), "paid_up"]
    ]
  end

  def order_options_for_preparing(order)
    [
      [I18n.t("enums.order.transaction_status.#{order.transaction_status}"), order.transaction_status],
      [I18n.t("enums.order.transaction_status.shipped"), "shipped"]
    ]
  end

  def transaction_status_display(order)
    case order.transaction_status
    when "paid_up", "producting"
      content_tag(:div, "製作ステータスを更新してください", class: "text-danger")
    end
  end
end