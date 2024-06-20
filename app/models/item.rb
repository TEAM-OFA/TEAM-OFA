class Item < ApplicationRecord
    has_one_attached :image
    
    has_many :cart_items, dependent: :destroy
    
    belongs_to :genre
    
    def with_tax_price
      return (price*1.1).floor
    end 
    
    
    # アイテム合計金額
    def total_item_amount
      order_details.sum { |order_detail| order_detail.subtotal }
    end 
end
