class InventoryNote < ApplicationRecord
  acts_as_paranoid

  after_create :update_code

  ATTRIBUTES_PARAMS = [
    :id, :code, :inventory_date, :status, :note, :creator_id, :balance_date,
    inventory_note_details_attributes: InventoryNoteDetail::ATTRIBUTES_PARAMS
  ].freeze

  has_many :inventory_note_details, dependent: :destroy

  belongs_to :creator, class_name: User.name

  accepts_nested_attributes_for :inventory_note_details,
    allow_destroy: true,
    reject_if: proc{ |attributes| attributes[:product_id].blank? }

  def update_code
    code = "ICF#{10000 + id}"
    update_column :code, code
  end
end
