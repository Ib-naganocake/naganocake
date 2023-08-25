class Admin::SearchesController < ApplicationController

  def index
    @word = params[:word]
    @search_items = Item.where("name LIKE ?", "%#{@word}%")
    @items = @search_items.page(params[:page])
  end

end
