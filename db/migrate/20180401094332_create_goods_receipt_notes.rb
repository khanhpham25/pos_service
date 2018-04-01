class CreateGoodsReceiptNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :goods_receipt_notes do |t|
      t.string :code
      t.integer :status
      t.integer :provider_id
      t.text :note
      t.datetime :import_date
      t.integer :payment_method_id
      t.decimal :paid_for_customer, precision: 64, scale: 12

      t.timestamps
    end
  end
end
