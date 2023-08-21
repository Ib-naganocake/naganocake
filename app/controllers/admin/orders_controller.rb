class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]

  def show
    @order_details = @order.order_details
  end

  def index
    customer_id = params[:customer_id]
    @customer = Customer.find(customer_id)
    @orders = @customer.orders.page(params[:page])
  end

  def update
    if @order.update(order_params)
      flash[:order_notice] = "注文ステータスの更新に成功しました。"
      flash[:color] = "text-success"
      redirect_to admin_order_path(@order)
    else
      flash[:order_notice] = "注文ステータスの更新に失敗しました。"
      flash[:color] = "text-danger"
      render :show
    end
  end

  def transaction_status_options
    case @order.transaction_status
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

  private

  def order_params
    params.require(:order).permit(:transaction_status)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end