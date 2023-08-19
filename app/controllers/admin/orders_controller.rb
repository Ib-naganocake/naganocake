class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @order = Order.find(params[:id])
  end

  def update
  end
end
