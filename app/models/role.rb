class Role < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id name ].freeze

  has_many :role_functions, dependent: :destroy
  has_many :roles, through: :role_functions
end
