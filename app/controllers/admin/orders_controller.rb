class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]

  def show
    @order_detail = @order.order_details
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

  private

  def order_params
    params.require(:order).permit(:transaction_status)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end