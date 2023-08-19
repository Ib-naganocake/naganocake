class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_page_customers_path, notice: "会員の登録情報を変更しました。"
    else
      render :edit
    end
  end

  def confirm_withdraw
  end

  def withdraw
    if current_customer.update(is_active: false)
      reset_session
      redirect_to root_path, notice: "退会処理が完了しました。"
    else
      render :confirm_withdraw, notice: "退会処理に失敗しました。"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
