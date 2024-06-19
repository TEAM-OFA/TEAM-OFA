class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    # @orders = OrderDetail.all.page(params[:page]).per(10)
    @orders = Order.order(created_at: :desc).includes(:customer, :order_details).page(params[:page]).per(10)
    # @orders = @customer.orders
  end

  # def index
    # @orders = Order.

   def destroy
   end
end

