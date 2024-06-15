class CreateOrderDatails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_datails do |t|
    t.integer :amount, null: false
    t.integer :price, null: false
    t.integer :maiking_status, null: false
    
   
      t.timestamps
    end
  end
end
