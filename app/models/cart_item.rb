class CartItem < ApplicationRecord

 belongs_to :customer
 belongs_to :item
 belongs_to :order, optional: true

 def with_tax_price
   return (price*1.1).floor
 end
 def subtotal
   item.with_tax_price*amount
 end
end
