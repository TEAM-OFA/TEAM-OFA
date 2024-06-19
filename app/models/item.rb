class Item < ApplicationRecord
    has_one_attached :image
    
    has_many :cart_items, dependent: :destroy
    
    belongs_to :genre
    
    def with_tax_price
      return (price*1.1).floor
    end 
    
    def self.looks(search, word)
      if search == "partial" #部分一致がpartital
        where("name LIKE ?", "%#{word}%")
      end
    end 
end
