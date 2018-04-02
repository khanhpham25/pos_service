class Function < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id name group_id ].freeze

  belongs_to :function_group

  has_many :role_functions, dependent: :destroy
  has_many :roles, through: :role_functions
end
