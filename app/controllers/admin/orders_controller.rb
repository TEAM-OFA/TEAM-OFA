class Admin::OrdersController < ApplicationController

 before_action :authenticate_admin!


    def show
     @order = Order.find(params[:id])
     @order_details = @order.order_details

    end

   def update
    @order = Order.find(params[:id])
    @order.update(order_status: params[:order][:order_status])
    @order_detail = @order.order_details
    redirect_to admin_order_path

    if params[:order][:order_status] == "payment_confirmation"
     @order_detail.update(making_status: 1)
    end
   end

  private

  def order_params
   params.require(:order).permit(:order_status)
  end

end

