module Serializers
  class GoodsReceiptNoteSerializer < Serializers::BaseSerializer
    attrs :id, :code, :status, :provider, :note, :import_date,
      :payment_method, :paid_for_customer, :goods_receipt_note_details

    def provider
      object.provider
    end

    def payment_method
      object.payment_method
    end

    def goods_receipt_note_details
      Serializers::GoodsReceiptNoteDetailSerializer
        .new object: object.goods_receipt_note_details
    end
  end
end
