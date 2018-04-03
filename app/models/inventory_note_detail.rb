class InventoryNoteDetail < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[
     id inventory_note_id product_id real_quantity in_stock amount_deviation price_deviation 
  ].freeze

  belongs_to :inventory_note
  belongs_to :product
end
