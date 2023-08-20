class Public::SearchesController < ApplicationController

  def index
    @genres = Genre.all
    @word = params[:word]
    @search_items = Item.where("name LIKE ?", "%#{@word}%")
    @items = @search_items.page(params[:page]).per(8)
  end

end
