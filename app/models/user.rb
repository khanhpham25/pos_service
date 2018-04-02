class User < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[
    id name password phone email address status role_id
  ].freeze

  has_one :role

  has_many :receipts, foreign_key: :creator_id
end
