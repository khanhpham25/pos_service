class CreateFunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :functions do |t|
      t.string :name
      t.integer :group_id

      t.timestamps
    end
  end
end
