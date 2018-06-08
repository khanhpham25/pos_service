class AddDescriptionToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :description, :text
  end
end
