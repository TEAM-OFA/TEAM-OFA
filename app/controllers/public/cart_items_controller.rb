class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:create]

  def index
    @cart_items = CartItem.all
        
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path, notice: 'カートに商品を追加しました。'
  end 
  
  def update
    @cart_item = CartItem.find(cart_item_params)
  end 
  
  def destroy
  end 
  
  def destroy_all
  end 
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
