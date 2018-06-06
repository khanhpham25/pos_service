class Receipt < ApplicationRecord
  acts_as_paranoid

  after_save :update_code

  ATTRIBUTES_PARAMS = [
    :id, :code, :creator_id, :date_time, :customer_id, :status,
    :customer_payment, :payment_method_id, :note,
    receipt_details_attributes: ReceiptDetail::ATTRIBUTES_PARAMS
  ].freeze

  belongs_to :customer, optional: true
  belongs_to :payment_method
  belongs_to :creator, -> {with_deleted}, class_name: User.name

  has_many :receipt_details, dependent: :destroy

  accepts_nested_attributes_for :receipt_details, allow_destroy: true,
    reject_if: proc{ |attributes| attributes[:product_id].blank? }

  private

    def update_code
      code = "RC#{10000 + self.id}"
      self.update_column :code, code
    end
end
