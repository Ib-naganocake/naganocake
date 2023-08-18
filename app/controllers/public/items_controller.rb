class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @all_items = Item.all
  end

  def show
  end
end
