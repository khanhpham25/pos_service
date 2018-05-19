module Serializers
  class InventoryNoteSerializer < Serializers::BaseSerializer
    attrs :id, :code, :inventory_date, :status, :note, :inventory_note_details

    def inventory_note_details
      Serializers::InventoryNoteDetailSerializer
        .new object: object.inventory_note_details
    end
  end
end
