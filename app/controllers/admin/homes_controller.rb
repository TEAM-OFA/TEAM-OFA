class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
   def top
     @order = current_customer.orders
     @orders = @customer.orders
   end 
   
   def destroy
   end 
end
