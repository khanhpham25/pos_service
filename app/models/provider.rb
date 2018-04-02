class Provider < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id name code phone email address tax_code note ].freeze

  has_many :goods_receipt_notes
end
