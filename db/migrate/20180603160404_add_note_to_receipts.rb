class AddNoteToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :note, :text
  end
end
