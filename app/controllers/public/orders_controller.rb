class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

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
