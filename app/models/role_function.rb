class RoleFunction < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id role_id function_id ].freeze

  belongs_to :role
  belongs_to :function
end
