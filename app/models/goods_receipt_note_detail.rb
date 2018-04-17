class GoodsReceiptNoteDetail < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[
    id goods_receipt_note_id product_id amount unit_price
  ].freeze

  belongs_to :product
  belongs_to :goods_receipt_note
end
