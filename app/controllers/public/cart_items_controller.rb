class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer, only: [:update, :destroy]

  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price_without_tax * 1.1 * cart_item.amount}
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

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "#{@cart_item.item.name}を削除しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice] = "カートアイテムを全て削除しました。"
    redirect_back(fallback_location: root_path)
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
  def is_matching_login_customer
    cart_item = CartItem.find(params[:id])
    customer = cart_item.customer
    unless customer.id == current_customer.id
      redirect_to cart_items_path
    end
  end

end
