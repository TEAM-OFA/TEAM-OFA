class Address < ApplicationRecord
  
  validates :post_code, presence: true
  
end
