class InventoryNote < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[ id code inventory_date status note ].freeze

  has_many :inventory_note_details, dependent: :destroy
end
