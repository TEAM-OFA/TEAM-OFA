class Order < ApplicationRecord
  belongs_to :customer


  has_many :cart_items

  enum payment_method:{ "クレジットカード": 0, "銀行振込": 1}
  enum status: {a:0, b:1, c:2, d:3, e:4}
end



