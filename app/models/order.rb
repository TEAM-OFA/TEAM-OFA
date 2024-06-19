class Order < ApplicationRecord
  belongs_to :customer

  enum address:[:"ご自身の住所", :"登録済み住所から選択", :"新しいお届け先"]
  enum payment_method:{ "クレジットカード": 0, "銀行振込": 1}
  

end
