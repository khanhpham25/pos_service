class InventoryNote < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = [
    :id, :code, :inventory_date, :status, :note,
    inventory_note_details: InventoryNoteDetail::ATTRIBUTES_PARAMS
  ].freeze

  has_many :inventory_note_details, dependent: :destroy

  accepts_nested_attributes_for :inventory_note_details,
    allow_destroy: true,
    reject_if: proc{ |attributes| attributes[:product_id].blank? }
end
