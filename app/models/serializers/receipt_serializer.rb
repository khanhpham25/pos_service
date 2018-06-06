module Serializers
  class ReceiptSerializer < Serializers::BaseSerializer
    attrs :id, :code, :creator, :date_time, :customer, :status,
      :customer_payment, :payment_method, :note

    def creator
      object.creator
    end

    def customer
      object.payment_method
    end

    def payment_method
      object.payment_method
    end

    def inventory_note_details
      Serializers::ReceiptDetailSerializer
        .new object: object.inventory_note_details
    end
  end
end
