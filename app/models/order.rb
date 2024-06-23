class Order < ApplicationRecord
 belongs_to :customer

 has_many :order_details
 has_many :cart_items



 enum payment_method:{ credit_card: 0, transfer: 1}

# enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}
 enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, making: 2, shipping_in_process: 3, shipped: 4 }
  # 入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4

  with_options presence: true do
     validates :post_code
     validates :address
     validates :name
   end

end







