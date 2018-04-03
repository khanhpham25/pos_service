class GoodsReceiptNote < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ 
    id code status provider_id note import_date payment_method_id paid_for_customer
  ].freeze

  belongs_to :provider
  belongs_to :payment_method

  has_many :goods_receipt_note_details, dependent: :destroy
end
