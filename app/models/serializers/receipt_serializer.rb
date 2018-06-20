module Serializers
  class ReceiptSerializer < Serializers::BaseSerializer
    attrs :id, :code, :creator, :date_time, :customer, :status,
      :customer_payment, :payment_method, :note, :receipt_details

    def creator
      object.creator
    end

    def customer
      object.customer
    end

    def payment_method
      object.payment_method
    end

    def receipt_details
      Serializers::ReceiptDetailSerializer
        .new(object: object.receipt_details).serializer
    end
  end
end
