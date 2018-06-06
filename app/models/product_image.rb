class ProductImage < ApplicationRecord
  acts_as_paranoid

  mount_uploader :image, ImageUploader

  ATTRIBUTES_PARAMS = %i[ id image product_id ].freeze

  belongs_to :product
end
