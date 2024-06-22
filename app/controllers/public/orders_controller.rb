class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @customer = current_customer
    @addresses = current_customer.addresses
    @order = Order.new
  end

  def check
    @cart_items = current_customer.cart_items
    @customer = current_customer
    @order = Order.new(order_params)
    @shopping_cost = 800
    @order.order_status = 0

    @selected_payment_method = params[:order][:payment_method]

    address_option = params[:address_option]

    case address_option
      when "0"
        @selected_address = "〒" + @customer.post_code + "　" + @customer.address + "　" + @customer.last_name + @customer.first_name
        @order.address = @customer.address
        @order.name = @customer.last_name + @customer.first_name
        @order.post_code = @customer.post_code
      when "1"
        # unless params[:order][:registered_address_id] == ""
          selected = Address.find(params[:order][:address_id])
          @selected_address = "〒" + selected.post_code + "　" + selected.address + "　" + selected.name
          @order.address = selected.address
          @order.name = selected.name
          @order.post_code = selected.post_code
    	 # else
    	 # render :new
    	 # end
      when "2"
        unless params[:order][:post_code] == "" && params[:order][:address] == "" && params[:order][:name] == ""
	        @selected_address = "〒" + params[:order][:post_code] + "　" + params[:order][:address] + "　" + params[:order][:name]
      	else
      	  render :new
      	end
       else
        render :new
    end


  end

  def create
    cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if @order.save
      cart_items.each do |cart|
        OrderDetail.create!(
        item_id: cart.item.id,
        amount: cart.amount,
        price: cart.item.price,
        order_id: @order.id,
        making_status: 0
        )
      end
    end




    if params[:address_option] == "2"
      current_customer.address.create(address_params)
    end

    @cart_items = current_customer.cart_items
    @cart_items.destroy_all

    redirect_to thanks_orders_path

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @shopping_cost = 800
  end

  def thanks
  end

private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :post_code, :order_status, :shopping_cost, :total_payment, :address, :name)
  end

end

