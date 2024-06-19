class Admin::OrdersController < ApplicationController
 before_action :authenticate_admin!



    # def index
     # @customer = Customer.find(params[:customer_id])
     # @orders = @customer.orders
     # @order = current_customer.orders
    # end

    def show
     @order = Order.find(params[:id])
     @order_detaiis = @order.order_details
    end


    def update
     @oder = Order.find(params[:id])
     @oder.update(order_status: params[:oder][:order_status])
     @order_details = @order.order_details

     if params[:oder][:order_status] == "making"
      order_detail.update(status: "in_making")
     end

     if is_all_order_shipped_in_process(order_detail)
      order_detail.update(status: "making_completed")
     end

     flash[:notice] = "更新に成功しました"
     redirect_to admin_order_path
    end


    private

    def order_params
     params.require(:oder).permit(:order_status)
    end

    def is_all_order_shipped_in_process(order_detail)
     order_detail.order.each do |order|
      if order.order_status != 'shipped'
       return false
      end
     end
     return true
    end
end


