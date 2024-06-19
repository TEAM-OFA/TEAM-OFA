class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @addresses = current_customer.addresses
    @order = Order.new
  end

  def check
    @cart_items = current_customer.cart_items.all
    @customer = current_customer
    @order = Order.new
    @selected_payment_method = params[:order][:payment_method]

    address_option = params[:address_option]

    case address_option
      when "0"
        @selected_address = "〒" + @customer.post_code + "　" + @customer.address + "　" + @customer.last_name + @customer.first_name
      when "1"
        unless params[:order][:registered_address_id] == ""
          selected = Address.find(params[:order][:address_id])
          @selected_address = "〒" + selected.post_code + "　" + selected.address + "　" + selected.name
    	  else
    	  render :new
    	  end
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
  end

  def index
  end

  def show
  end

  def thanks
  end

end
