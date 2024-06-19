class Public::ItemsController < ApplicationController
 before_action :authenticate_customer!, except: [:index, :show]
    
 def index
  @items = Item.all.page(params[:page]).per(8)
 end 
 
 def show
  @item =Item.find(params[:id])
  @cart_item =CartItem.new
 end 
 
 private
  def item_params
   params.require(:items).permit(:genre_id,:name,:introduction,:image,:price)
  end
end
