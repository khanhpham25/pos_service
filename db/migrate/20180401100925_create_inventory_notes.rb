class CreateInventoryNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_notes do |t|
      t.string :code
      t.datetime :invetory_date
      t.integer :status
      t.text :note
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
