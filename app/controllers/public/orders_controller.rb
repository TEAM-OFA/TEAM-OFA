class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @addresses = current_customer.addresses
    @order = Order.new
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
