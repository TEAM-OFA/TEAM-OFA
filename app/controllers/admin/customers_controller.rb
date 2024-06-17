class Admin::CustomersController < ApplicationController


  def index

    # @customers = Customer.page(params[:page])
    @customers = Customer.all

  end
end

