class CreateFunctionGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :function_groups do |t|
      t.string :name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
