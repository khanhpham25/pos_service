class Customer < ApplicationRecord
  acts_as_paranoid

  after_create :update_code

  ATTRIBUTES_PARAMS = %i[ id code name address phone customer_type_id ].freeze

  belongs_to :customer_type
  has_many :receipts

  def update_code
    code = "CUS#{10000 + id}"
    update_column :code, code
  end
end
