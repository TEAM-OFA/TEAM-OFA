class Item < ApplicationRecord
    has_one_attached :image

    has_many :cart_items, dependent: :destroy
    has_many :order_details
    belongs_to :genre

    def with_tax_price
      return (price*1.1).floor
    end 
    # アイテム合計金額
    def total_item_amount
      order_details.sum { |order_detail| order_detail.subtotal }
    end 

    def self.looks(search, word)
      if search == "partial" #部分一致がpartital
        where("name LIKE ?", "%#{word}%")
      end
    end 

end
