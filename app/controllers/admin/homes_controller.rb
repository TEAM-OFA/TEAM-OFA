class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!



  def top
    @orders = Order.order(created_at: :desc).includes(:customer, :order_details).page(params[:page]).per(10)

  end
#   def top
    #  @orders = Order.all.page(params[:page]).per(10)
    #  @orders = @customer.orders


   def destroy
   end





end
