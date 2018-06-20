class AddCreatorIdToInventoryNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :inventory_notes, :creator_id, :integer
  end
end
