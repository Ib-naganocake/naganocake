class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to item_path(@cart_item.item)
    end
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
