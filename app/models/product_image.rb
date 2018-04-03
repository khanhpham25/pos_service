class ProductImage < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id image product_id ].freeze

  belongs_to :product
end
