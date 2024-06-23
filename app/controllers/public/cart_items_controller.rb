class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:create]

  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
  # 新しいカートアイテムの作成
  @cart_item = current_customer.cart_items.new(cart_item_params)

  # 既存のカートアイテムの検索
  existing_cart_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)

  if existing_cart_item.present?
    # 既存のカートアイテムが存在する場合、その数量を更新
    existing_cart_item.amount += @cart_item.amount
    existing_cart_item.save
  else
    # 新しいカートアイテムを保存
    @cart_item.save
  end

  # リダイレクト
  redirect_to cart_items_path, notice: 'カートに商品を追加しました。'
  end 
  
  def update
    @cart_item =current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end 
  
  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: 'カートアイテムを削除しました。'
  end 
  
  def destroy_all
    @cart_items = current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カートを空にしました。'
  end 
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
