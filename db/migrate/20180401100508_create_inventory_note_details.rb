class CreateInventoryNoteDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_note_details do |t|
      t.integer :inventory_note_id
      t.integer :product_id
      t.integer :real_quantity
      t.integer :in_stock
      t.integer :amount_deviation
      t.decimal :price_deviation, precision: 64, scale: 12
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
