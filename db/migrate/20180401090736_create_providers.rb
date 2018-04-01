class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :code
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :tax_code
      t.text :note

      t.timestamps
    end
  end
end
