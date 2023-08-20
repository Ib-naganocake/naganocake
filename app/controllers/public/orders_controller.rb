class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.shipping_address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.name = params[:order][:name]
      if @order.postal_code.blank? || @order.shipping_address.blank? || @order.name.blank?
        @addresses = current_customer.addresses
        render :new
      end
    else
      redirect_to new_order_path
    end
    @cart_items = current_customer.cart_items
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price_including_tax = (cart_item.item.price_without_tax * 1.1).floor
      @order_detail.order_id =  @order.id
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def complete
  end

  def index
    @orders = Order.page(params[:page]).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit(:name, :total_price, :postal_code, :payment_method, :shipping_address , :shipping_fee, :customer_id)
  end

end
