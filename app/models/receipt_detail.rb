class ReceiptDetail < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id quantity product_id unit_price receipt_id ].freeze

  belongs_to :receipt
  belongs_to :product
end
