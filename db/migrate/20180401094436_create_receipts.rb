class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :code
      t.datetime :date_time
      t.integer :status
      t.integer :creator_id
      t.integer :customer_id
      t.decimal :customer_payment, precision: 64, scale: 12
      t.integer :payment_method_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
