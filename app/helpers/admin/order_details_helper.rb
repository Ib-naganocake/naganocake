module Admin::OrderDetailsHelper

  def calculate_subtotal(order_detail)
    subtotal = order_detail.price_including_tax * order_detail.amount
    subtotal
  end

  def production_status_options(order_detail)
    case order_detail.production_status
    when "waiting"
      options_for_waiting(order_detail)
    when "producting"
      options_for_producting(order_detail)
    else
      [[I18n.t("enums.order_detail.production_status.#{order_detail.production_status}"), order_detail.production_status]]
    end
  end

  def options_for_waiting(order_detail)
    [
      [I18n.t("enums.order_detail.production_status.#{order_detail.production_status}"), order_detail.production_status],
      [I18n.t("enums.order_detail.production_status.producting"), "producting"]
    ]
  end

  def options_for_producting(order_detail)
    [
      [I18n.t("enums.order_detail.production_status.#{order_detail.production_status}"), order_detail.production_status],
      [I18n.t("enums.order_detail.production_status.complete"), "complete"]
    ]
  end
end