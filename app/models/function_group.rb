class FunctionGroup < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id name ].freeze

  has_many :functions
end
