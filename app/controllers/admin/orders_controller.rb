class Admin::OrdersController < ApplicationController

 before_action :authenticate_admin!


    def show
     @order = Order.find(params[:id])
     # @customer = Customer.find(params[:id])
     @item = Item.find(params[:id])
     @order_details = @order.order_details
     # @oder_items = @order.order_details
     # @total_item_amount = @order_details.sum { |order_detail| order_detail.subtotal }
    end

   def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
   end

  private

  def order_params
   params.require(:order).permit(:order_status)
  end

end

