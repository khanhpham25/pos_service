class Customer < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id code name address customer_type_id ].freeze

  belongs_to :customer_type
  has_many :receipts
end
