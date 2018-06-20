module Serializers
  class InventoryNoteSerializer < Serializers::BaseSerializer
    attrs :id, :code, :inventory_date, :balance_date, :status, :note, :inventory_note_details,
      :creator

    def creator
      object.creator
    end

    def inventory_note_details
      Serializers::InventoryNoteDetailSerializer
        .new(object: object.inventory_note_details).serializer
    end
  end
end
