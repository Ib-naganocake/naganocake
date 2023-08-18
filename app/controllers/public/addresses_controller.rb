class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    
    @address = Address.new
  end
  
  def create
    @address = Address.new
    @address.customer_id = current_user.id
    if @address.save
      redirect_to request.referer
    else
      @addresses = Address.all
      render index
    end
  end

  def edit
  end
end
