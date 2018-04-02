class Attribute < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id name ].freeze

  has_many :product_attributes, dependent: :destroy
end
