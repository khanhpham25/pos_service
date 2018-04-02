class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :code
      t.string :name
      t.string :address
      t.integer :customer_type_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
