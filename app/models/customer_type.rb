class CustomerType < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id name ].freeze
end
