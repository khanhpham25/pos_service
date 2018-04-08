class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.integer :status
      t.integer :role_id
      t.string :password_digest
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
