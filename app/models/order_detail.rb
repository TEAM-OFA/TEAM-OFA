class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item


  enum making_status: { making_unable: 0, waiting_for_making: 1, in_making: 2, making_completed: 3 }
  # 1.着手不可 2.製作待ち 3.製作中 4.製作完了

  # 数量x商品税込価格
  def subtotal
   amount * item.with_tax_price
  end

end
