class Address < ApplicationRecord


  validates :post_code, :address, :name, presence: true

  belongs_to :customer

  def full_address
    "〒" + post_code + "　" + address + "　" + name
  end


end
