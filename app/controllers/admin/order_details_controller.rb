class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      update_transaction_status
      flash[:order_detail_notice] = "製作ステータスの更新に成功しました。"
      flash[:color] = "text-success"
      redirect_to admin_order_path(@order_detail.order)
    else
      flash[:order_detail_notice] = "製作ステータスの更新に失敗しました。"
      flash[:color] = "text-danger"
      redirect_back(fallback_location: admin_order_path(@order_detail.order))
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

  def update_transaction_status
    if order_detail_params[:production_status].include?("producting")
      @order_detail.order.update(transaction_status: 2)
    elsif all_order_details_complete?
      @order_detail.order.update(transaction_status: 3)
    end
  end

  def all_order_details_complete?
    @order_detail.order.order_details.all? do |detail|
      detail.production_status == "complete"
    end
  end
end
