module Serializers
  class ReceiptDetailSerializer < Serializers::BaseSerializer
    attrs :id, :quantity, :product, :unit_price, :receipt_id

    def product
      Serialiers::ProductSerializer.new object: object.product
    end
  end
end
