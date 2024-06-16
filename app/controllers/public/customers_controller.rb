class Public::CustomersController < ApplicationController

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to root_path
  end




  def out
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email)
  end

end
