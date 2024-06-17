class Address < ApplicationRecord

  validates :post_code, presence: true
  belongs_to :customer

end
