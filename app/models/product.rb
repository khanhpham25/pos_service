class Product < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id name code sale_price initial_cose stock_count category_id is_selling ].freeze

  belongs_to :category

  has_many :product_attributes, dependent: :destroy
  has_many :goods_receipt_note_details, dependent: :destroy
  has_many :inventory_note_details, dependent: :destroy
  has_many :product_images, dependent: :destroy
  has_many :receipt_details, dependent: :destroy
end
