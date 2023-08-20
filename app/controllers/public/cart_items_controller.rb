class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path, notice: "商品を追加しました。"
    elsif @cart_item.save
      redirect_to cart_items_path, notice: "商品をカートに登録しました。"
    else
      redirect_to item_path(@cart_item.item), notice: "個数を選択してください"
    end
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
