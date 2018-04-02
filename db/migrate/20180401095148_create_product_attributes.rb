class CreateProductAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attributes do |t|
      t.string :value
      t.integer :product_id
      t.integer :attribute_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
