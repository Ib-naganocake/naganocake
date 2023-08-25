class Admin::CustomersController < ApplicationController
  before_action :get_customer_id, only: [:show, :edit, :update]

  def index
    @customers = Customer.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    @original_customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報の編集に成功しました。"
      flash[:color] = "text-success"
      redirect_to admin_customer_path(@customer)
    else
    # エラー箇所に元のデータを代入する
      @original_customer.attributes.each do |attr, value|
        @customer[attr] = value unless @customer.errors[attr].empty?
    end
      flash[:notice] = "会員情報の編集に失敗しました。"
      flash[:color] = "text-danger"
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

  def get_customer_id
    @customer = Customer.find(params[:id])
  end
end
