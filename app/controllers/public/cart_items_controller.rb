class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price_without_tax * 1.1 * cart_item.amount}
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    # flash[:notice] = "カートアイテムを削除しました。"
    flash[:notice] = "#{@cart_item.item.name}を削除しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    # cart_items = current_customer.cart_items
    # cart_items.destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice] = "カートアイテムを全て削除しました。"
    redirect_back(fallback_location: root_path)
  end

  private

end
