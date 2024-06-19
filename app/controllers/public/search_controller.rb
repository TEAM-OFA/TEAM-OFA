class Public::SearchController < ApplicationController
  def search
    @word = params[:word]
    @search = params[:search]
    @range = params[:range] # 範囲
    
    if @range == "商品"
      @items = Item.looks(@search, @word)
      @genres = Genre.all
      @item = @items.first unless @items.empty?
    end
  end
end
