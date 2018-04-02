class Receipt < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[
    id code creator_id date_time customer_id status customer_payment payment_method_id 
  ].freeze

  belongs_to :customer, optional: true
  belongs_to :payment_method
  belongs_to :creator, -> {with_deleted}, class_name: User.name

  has_many :receipt_details, dependent: :destroy
end
