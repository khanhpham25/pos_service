class ChangeColumnNameInventoryNote < ActiveRecord::Migration[5.1]
  def change
    rename_column :inventory_notes, :invetory_date, :inventory_date
  end
end
