class Provider < ApplicationRecord
  acts_as_paranoid

  after_create :update_code

  ATTRIBUTES_PARAMS = %i[ id name code phone email address tax_code note ].freeze

  has_many :goods_receipt_notes

  def update_code
    code = "PV#{10000 + id}"
    update_column :code, code
  end
end
