class CreateGoodsReceiptNoteDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :goods_receipt_note_details do |t|
      t.integer :goods_receipt_note_id
      t.integer :product_id
      t.integer :amount
      t.decimal :unit_price, precision: 64, scale: 12
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
