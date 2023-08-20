class Public::OrdersController < ApplicationController
  def new
  end

  def index
    @orders = Order.page(params[:page])
  end

  def show
  end

  def confirm
  end

  def complete
  end
end
