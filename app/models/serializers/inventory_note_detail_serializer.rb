module Serializers
  class InventoryNoteDetailSerializer < Serializers::BaseSerializer
    attrs :id, :inventory_note_id, :product, :real_quantity, :in_stock,
      :amount_deviation, :price_deviation

    def product
      Serializers::ProductSerializer.new(object: object.product).serializer
    end
  end
end
