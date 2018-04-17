module Serializers
  class InventoryNoteDetailSerializer < Serializers::BaseSerializer
    attrs :id, :inventory_note_id, :product, :real_quantity, :in_stock,
      :amount_deviation, :price_deviation

    def product
      Serialiers::ProductSerializer.new object: object.product
    end
  end
end
