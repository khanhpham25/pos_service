module Serializers
  class GoodsReceiptNoteDetailSerializer < Serializers::BaseSerializer
    attrs :id, :goods_receipt_note_id, :product, :amount, :unit_price

    def product
      Serializers::ProductSerializer.new(object: object.product).serializer
    end
  end
end
