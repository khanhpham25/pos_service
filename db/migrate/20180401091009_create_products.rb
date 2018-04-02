class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.decimal :sale_price, precision: 64, scale: 12 
      t.decimal :initial_cost, precision: 64, scale: 12 
      t.integer :stock_count
      t.integer :category_id
      t.boolean :is_selling
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
