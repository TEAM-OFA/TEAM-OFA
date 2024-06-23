# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :reject_customer, only: [:create]
  before_action :reject_customer, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  protected

  def reject_customer
  @customer = Customer.find_by(email: params[:customer][:email])

  if @customer && @customer.valid_password?(params[:customer][:password])
    if @customer.is_active
      sign_in(@customer) # ログイン処理を実行
      redirect_to root_path
    else
      flash[:withdrawal_notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_customer_registration_path
    end
  else
    # 該当するユーザが見つからない場合やパスワードが違う場合の処理
    flash[:login_notice] = "メールアドレスまたはパスワードが正しくありません。"
    redirect_to new_customer_session_path
  end
 end




  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
