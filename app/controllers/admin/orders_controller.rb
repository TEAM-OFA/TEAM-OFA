class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!
  
  
  
    def index
     @customer = Customer.find(params[:customer_id])
     @orders = @customer.orders
    end 
    
    def show
     @order = Order.find(params[:id])
     @order_detaiis = @order.order_details
    end
    
    
    
end

