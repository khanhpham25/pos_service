class CreateRoleFunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :role_functions do |t|
      t.integer :role_id
      t.integer :function_id

      t.timestamps
    end
  end
end
