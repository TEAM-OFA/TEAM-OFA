class Admin::SearchController < ApplicationController
  def search
    @word = params[:word]
    @search = params[:search]
    @range = params[:range]
    
    if @range == "商品"
      @items = Item.looks(@search, @word)
      @genres = Genre.all
    else
      @items = []
    end
  end
end
