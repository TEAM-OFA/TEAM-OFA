class Public::HomesController < ApplicationController

    before_action :authenticate_customer!
    def top
     @items = Item.page(params[:page]).per(4).order(created_at: :desc)
    end 
end
