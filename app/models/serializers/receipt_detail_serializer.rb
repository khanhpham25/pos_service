module Serializers
  class ReceiptDetailSerializer < Serializers::BaseSerializer
    attrs :id, :quantity, :product, :unit_price, :receipt_id

    def product
      Serializers::ProductSerializer.new(object: object.product).serializer
    end
  end
end
