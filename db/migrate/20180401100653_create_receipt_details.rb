class CreateReceiptDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :receipt_details do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :unit_price, precision: 64, scale: 12
      t.integer :order_id

      t.timestamps
    end
  end
end
