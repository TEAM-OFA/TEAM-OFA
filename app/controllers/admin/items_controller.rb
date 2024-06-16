class Admin::ItemsController < ApplicationController
 def new
     @item = Item.new
     @genres = Genre.all
 end 
 
 def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path, notice: '商品が正常に作成されました。'
    else
      render :new
    end
  end
 
 def index
  @items = Item.all
 end 
 
 def show
 end 
 
 def edit
 end 
 
 def update
 end 
 
 private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :is_active, :genre_id, :price)  
  end

end
