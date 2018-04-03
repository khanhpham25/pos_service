class Category < ApplicationRecord
  acts_as_paranoid
  acts_as_tree

  ATTRIBUTES_PARAMS = %i[ id name parent_id ].freeze

  belongs_to :parent, class_name: Category.name

  has_many :products
end
