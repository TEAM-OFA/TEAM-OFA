class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

   def top
     @orders = Order.all.page(params[:page]).per(10
    #  @orders = @customer.orders
   end

   def destroy
   end
end
