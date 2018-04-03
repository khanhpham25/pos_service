class CreateFunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :functions do |t|
      t.string :name
      t.integer :function_group_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
