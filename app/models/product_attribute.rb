class ProductAttribute < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id value attribute_id product_id ].freeze

  belongs_to :product
  belongs_to :attribute
end
