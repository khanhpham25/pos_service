class GoodsReceiptNote < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = [
    :id, :code, :status, :provider_id, :note, :import_date,
    :payment_method_id, :paid_for_customer,
    goods_receipt_note_details: GoodsReceiptNoteDetail::ATTRIBUTES_PARAMS
  ].freeze

  belongs_to :provider
  belongs_to :payment_method

  has_many :goods_receipt_note_details, dependent: :destroy

  accepts_nested_attributes_for :goods_receipt_note_details,
    allow_destroy: true,
    reject_if: proc{ |attributes| attributes[:product_id].blank? }
end
