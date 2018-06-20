class AddBalanceDateToInventoryNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :inventory_notes, :balance_date, :datetime
  end
end
